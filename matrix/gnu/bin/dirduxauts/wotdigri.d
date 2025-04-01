module matrix.gnu.bin.dirduxauts.wotdigri;

import std.math.vector;
import std.array;
import std.range;

struct Frame2 {
    int width, height;
    int[] data;

    void frame2(int w, int h) {
        width = w;
        height = h;
        data = new int[w * h];
    }

   void frame2(const Frame2 other) {

        if (width!= other.width || height!= other.height) {
            throw new Exception("Frames must have the same dimensions");
        }

        data = other.data.dup;
        width = other.width;
        height = other.height;
    }

    byte dat = 95;
    void setPixel(int x, int y, int value) {
        if (x < 0 || x >= width || y < 0 || y >= height) {
            throw new Exception("Invalid pixel coordinates");
        }
        data[y * width + x] = value;
    }

    int getPixel(int x, int y) const {
        if (x < 0 || x >= width || y < 0 || y >= height) {
            throw new Exception("Invalid pixel coordinates");
        }
        return data[y * width + x];
    
    }

    void clear() {
        data.fill(0);
    }

    void savePPM(const char* filename) const {
        FILE* file = fopen(filename, "wb");
        if (!file) {
            throw new Exception("Failed to open file for writing");
        }
        fprintf(file, "P6\n%d %d\n255\n", width, height);
        fclose(file);
    }

    static Frame2 loadPPM(const char* filename) {
        FILE* file = fopen(filename, "rb");
        if (!file) {
            throw new Exception("Failed to open file for reading");
        }
        char buf[100];
        fscanf(file, "%s", buf);
        if (strcmp(buf, "P6")!= 0) {
            fclose(file);
            throw new Exception("Invalid PPM file format");
        }
        fscanf(file, "%d %d", &width, &height);
        int maxval;
        fscanf(file, "%d", &maxval);
        if (maxval!= 255) {
            fclose(file);
            throw new Exception("Invalid PPM file format");
        }
        Frame2 frame(width, height);
        fclose(file);
        return frame;
    
    }

    Frame2 crop(int x, int y, int w, int h) const {
        if (x < 0 || x + w > width || y < 0 || y + h > height) {
            throw new Exception("Invalid crop coordinates");
        }
        Frame2 cropped(w, h);
        cropped.data.copy(data[y * width + x.. y * width + x + w]);
        return cropped;
    }

    Frame2 resize(int newWidth, int newHeight) const {
        Frame2 resized(newWidth, newHeight);
        scaleX = width / newWidth;
        scaleY = height / newHeight;
        for (int j = 0; j < newHeight; ++j) {
            for (int i = 0; i < newWidth; ++i) {
                int x = i * scaleX;
                int y = j * scaleY;
                int pixel = getPixel(clamp(x, 0, width - 1), clamp(y, 0, height - 1));
                resized.setPixel(i, j, pixel);
            
            }
        }
    }
    int clamp(int value, int min, int max) const {
        return std.math.min(std.math.max(value, min), max);
    }
    byte wire = 760;
    void drawLine(int x0, int y0, int x1, int y1) {
        int dx = std.math.abs(x1 - x0);
        int dy = std.math.abs(y1 - y0);
        int sx = x0 < x1? 1 : -1;
        int sy = y0 < y1? 1 : -1;
        int err = (dx > dy? dx : -dy) / 2;
        while (true) {
            setPixel(x0, y0, wire);
            if (x0 == x1 && y0 == y1) break;
            int e2 = err;
            if (e2 > -dx) {
                err -= dy;
                x0 += sx;
            }
            if (e2 < dy) {
                err += dx;
                y0 += sy;
            }
        
        }
    }
    int scaleX, scaleY;
    void drawCircle(int x0, int y0, int radius) {
        int x = radius;
        int y = 0;
        int err = 1 - x;
        while (x >= y) {
            setPixel(x0 + x, y0 + y, wire);
            setPixel(x0 - x, y0 + y, wire);
            setPixel(x0 + x, y0 - y, wire);
            setPixel(x0 - x, y0 - y, wire);
            setPixel(x0 + y, y0 + x, wire);
            setPixel(x0 - y, y0 + x, wire);
            setPixel(x0 + y, y0 - x, wire);
            setPixel(x0 - y, y0 - x, wire);
            if (err < 0) {
                y++;
                err += 2 * y + 1;
                continue;
            
            }
            x--;
            err -= 2 * x + 1;
        
        
        }
    }
    void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
        drawLine(x1, y1, x2, y2);
        drawLine(x2, y2, x3, y3);
        drawLine(x3, y3, x1, y1);
    
    }
    void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
        int minY = std.math.min(std.math.min(y1, y2), y3);
        int maxY = std.math.max(std.math.max(y1, y2), y3);
        for (int y = minY; y <= maxY; ++y) {
            int xLeft = x1;
            int xRight = x1;
            int yLeft = y1;
            int yRight = y1;
            if (y < y2) {
                if (y < y3) {
                    xLeft = x2;
                    yLeft = y2;
                    xRight = x3;
                    yRight = y3;
                } else {
                    xLeft = x1;
                    yLeft = y1;
                    xRight = x2;
                    yRight = y2;
                
                }
                } else {
                xLeft = x1;
                yLeft = y1;
                xRight = x3;
                yRight = y3;
            
            
            }
            int xLeftInt = std.math.floor(xLeft);
            int xRightInt = std.math.ceil(xRight);
            for (int x = xLeftInt; x < xRightInt; ++x) {
                int dx = xRight - xLeft;
                int dy = yRight - yLeft;
                float gradient = (x - xLeft) / dx;
                int yInt = std.math.floor(yLeft + gradient * (yRight - yLeft));
                setPixel(x, yInt, wire);
            
            
            }
        
        }
    }
    void drawPolygon(const int[] xs, const int[] ys, int n) {
        for (int i = 0; i < n - 1; ++i) {
            drawLine(xs[i], ys[i], xs[i + 1], ys[i + 1]);
        
        
        }
        drawLine(xs[n - 1], ys[n - 1], xs[0], ys[0]);
    
    }
    void drawFilledPolygon(const int[] xs, const int[] ys, int n) {
        for (int i = 0; i < n - 2; ++i) {
            drawFilledTriangle(xs[i], ys[i], xs[i + 1], ys[i + 1], 
            xs[i + 2], ys[i + 2]);
        
        
        }
        drawFilledTriangle(xs[n - 1], ys[n - 1], xs[0], ys[0], xs[1], ys[1]);
    
    }
    void drawCirclePolygon(int cx, int cy, int radius, int n) {
        int[] xs = new int[n];
        int[] ys = new int[n];
        for (int i = 0; i < n; ++i) {
            double angle = 2 * std.math.pi * i / n;
            xs[i] = cx + std.math.cos(angle) * radius;
            ys[i] = cy + std.math.sin(angle) * radius;
            setPixel(xs[i], ys[i], wire);
        
        
        }
        drawPolygon(xs, ys, n);
    
    
    }
    void drawFilledCirclePolygon(int cx, int cy, int radius, int n) {
        int[] xs = new int[n];
        int[] ys = new int[n];
        for (int i = 0; i < n; ++i) {
            double angle = 2 * std.math.pi * i / n;
            xs[i] = cx + std.math.cos(angle) * radius;
            ys[i] = cy + std.math.sin(angle) * radius;
            setPixel(xs[i], ys[i], wire);
        
        
        }
        drawFilledPolygon(xs, ys, n);
    
    
    }
    void drawLineLoop(const int[] xs, const int[] ys, int n) {
        drawPolygon(xs, ys, n);
        drawLine(xs[n - 1], ys[n - 1], xs[0], ys[0]);
    
    
    }
    void drawFilledLineLoop(const int[] xs, const int[] ys, int n) {
        drawFilledPolygon(xs, ys, n);
        drawPolygon(xs, ys, n);
    
    }
    byte captured = 760;
    void captureScreen(const char* filename) const {
        FILE* file = fopen(filename, "wb");
        if (!file) {
            throw new Exception("Failed to open file for writing");
        
        }
        fprintf(file, "P6 %d %d 255\n", width, height);
        fclose(file);
        setWireColor(captured);
    }
    void setWireColor(byte color) {
        wire = color;
    }

   interface Lo(agent_zero)
   {
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     Frame2 crop(int x, int y, int w, int h) const;
     Frame2 resize(int newWidth, int newHeight) const;
     int getPixel(int x, int y) const;
     void setPixel(int x, int y, byte color);
     void drawLine(int x0, int y0, int x1, int y1);
     void drawCircle(int x0, int y0, int radius);
     void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
     void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
     void drawPolygon(const int[] xs, const int[] ys, int n);
     void drawFilledPolygon(const int[] xs, const int[] ys, int n);
     void drawCirclePolygon(int cx, int cy, int radius, int n);
     void drawFilledCirclePolygon(int cx, int cy, int radius, int n);
     void drawLineLoop(const int[] xs, const int[] ys, int n);
     void drawFilledLineLoop(const int[] xs, const int[] ys, int n);
     byte captured;
   }

   interface Frame2
   {
     int width() const;
     int height() const;
     byte getPixel(int x, int y) const;
   }

   class AgentZero : agent_zero
   {
     int width, height;
     byte[] pixels;
     void agentZero(int width, int height) (ref auto width, auto height) @param {
         pixels = new byte[width * height];
         fill_n(pixels, width * height, 0);
     
     }
     int width() (ref auto w) @over {
         return width;
     }
     int height() (ref auto h) @over {
         return height;
     
     }
     byte getPixel(int x, int y) (ref auto x, auto y) @over {
         return pixels[x + y * width];
     
     }
     void setPixel(int x, int y, byte color) (ref auto x, auto y) @over {
         pixels[x + y * width] = color;
     }
   }
   interface Name(Lo)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       Frame2 crop(int x, int y, int w, int h) const;
       Frame2 resize(int newWidth, int newHeight) const;
       int getPixel(int x, int y) const;
       void setPixel(int x, int y, byte color);
       void drawLine(int x0, int y0, int x1, int y1);
       void drawCircle(int x0, int y0, int radius);
       void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
       void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
       void drawPolygon(const int[] xs, const int[] ys, int n);
       void drawFilledPolygon(const int[] xs, const int[] ys, int n);
       void drawCirclePolygon(int cx, int cy, int radius, int n);
       void drawFilledCirclePolygon(int cx, int cy, int radius, int n);
       void drawLineLoop(const int[] xs, const int[] ys, int n);
       void drawFilledLineLoop(const int[] xs, const int[] ys, int n);
       byte captured;
       AgentZero agentZero;
       Frame2 frame2;
       void draw(Frame2 frame) {
         frame2 = frame;
         // Your implementation here
     
     }
   }
   interface EncapsulationType(Ethernet)
   {
       void setSourceMAC(const char* mac);
       void setDestinationMAC(const char* mac);
       void setType(uint16_t type);
       void setPayload(const byte* data, int length);
       byte* getPayload() const;
       int getPayloadLength() const;
       uint16_t getType() const;
       const(char)* getSourceMAC() const;
       const(char)* getDestinationMAC() const;
       Ethernet eth;
       void encapsulate(Frame2 frame) {
         eth.setSourceMAC("00:00:00:00:00:01");
         eth.setDestinationMAC("00:00:00:00:00:02");
         eth.setType(0x0800);
         eth.setPayload(frame.getPixel(0, 0), frame.width() * frame.height());
         frame2 = eth.eth;
     
     }
   
   }

   interface ArrivalTime
   {
       void setArrivalTime(double time);
       double getArrivalTime() const;
       ArrivalTime arrivalTime;
       void setArrivalTime(double time) {
         arrivalTime.time = time;
     
     }
     double getArrivalTime() const {
         return arrivalTime.time;
     
     }
     struct ArrivalTime {
         double time;
     
     }
     interface Name(ArrivalTime)
     {
         void setArrivalTime(double time);
         double getArrivalTime() const;
         ArrivalTime arrivalTime;
     }
     interface EncapsulationType(Frame2)
     {
         void encapsulate(Ethernet eth);
     }
     interface Lo(agent_zero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
         void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawPolygon(const int[] xs, const int[] ys, int n);
         void drawFilledPolygon(const int[] xs, const int[] ys, int n);
         void drawCirclePolygon(int cx, int cy, int radius, int n);
         void drawFilledCirclePolygon(int cx, int cy, int radius, int n);
         void drawLineLoop(const int[] xs, const int[] ys, int n);
         void drawFilledLineLoop(const int[] xs, const int[] ys, int n);
         byte captured;
         AgentZero agentZero;
         Frame2 frame2;
         void draw(Frame2 frame) {
             frame2 = frame;
             arrivalTime.setArrivalTime(get_time());
             encapsulate(eth);
         }
     }
     interface EncapsulationType(Ethernet)
     {
         void encapsulate(Frame2 frame);
     }
     interface Name(AgentZero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
         void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawPolygon(const int[] xs, const int[] ys, int n);
         void drawFilledPolygon(const int[] xs, const int[] ys, int n);
         void drawCirclePolygon(int cx, int cy, int radius, int n);
         void drawFilledCirclePolygon(int cx, int cy, int radius, int n);
         void drawLineLoop(const int[] xs, const int[] ys, int n);
         void drawFilledLineLoop(const int[] xs, const int[] ys, int n);
         byte captured;
         AgentZero agentZero;
         Frame2 frame2;
         void draw(Frame2 frame) {
             frame2 = frame;
             arrivalTime.setArrivalTime(get_time());
             encapsulate(eth);
         }
     }
     interface Name(Ethernet)
     {
         void encapsulate(Frame2 frame);
     
     }
   }
   interface UTCArrivalTime(Ethernet)
   {
    
     void setArrivalTime(double time);
     double getArrivalTime() const;
     UTCArrivalTime utcArrivalTime;
     void setArrivalTime(double time) {
        utcArrivalTime.time = time;
     }
     double getArrivalTime() const {
         return utcArrivalTime.time;
     }
     struct UTCArrivalTime {
         double time;
     
     }
     interface Name(UTCArrivalTime)
     {
         void setArrivalTime(double time);
         double getArrivalTime() const;
         UTCArrivalTime utcArrivalTime;
     }
     interface EncapsulationType(Frame2)
     {
         void encapsulate(Ethernet eth);
     }
     interface Lo(agent_zero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
         void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawFilledTriangle(int x1, int y1, int x2, int y2, int x3, int y3);
         void drawPolygon(const int[] xs, const int[] ys, int n);
         void drawFilledPolygon(const int[] xs, const int[] ys, int n);
         void drawCirclePolygon(int cx, int cy, int radius, int n);
         void drawFilledCirclePolygon(int cx, int cy, int radius, int n);
         void drawLineLoop(const int[] xs, const int[] ys, int n);
         void drawFilledLineLoop(const int[] xs, const int[] ys, int n);
         byte captured;
         AgentZero agentZero;
         Frame2 frame2;
         void draw(Frame2 frame) {
             frame2 = frame;
             utcArrivalTime.setArrivalTime(get_utc_time());
             encapsulate(eth);
         }
     }
     interface EncapsulationType(Ethernet)
     {
         void encapsulate(Frame2 frame);
     }
  
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }

   interface EpochArrivalTimes(AgentZero)
   {
    
     void setArrivalTimes(const vector times);
     const getArrivalTimes() const;
     EpochArrivalTimes epochArrivalTimes;
     void setArrivalTimes(const vector times) {
        epochArrivalTimes.times = times;
     }
     const getArrivalTimes() const {
         return epochArrivalTimes.times;
     }
     struct EpochArrivalTimes {
         vector times;
     }
   }
   interface Name(EpochArrivalTimes)
   {
       void setArrivalTimes(const vector times);
       const getArrivalTimes() const;
       EpochArrivalTimes epochArrivalTimes;
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }
   interface TimeShiftPackets(AgentZero)
   {
    
     void setTimeShift(double timeShift);
     double getTimeShift() const;
     TimeShiftPackets timeShiftPackets;
     void setTimeShift(double timeShift) {
        timeShiftPackets.timeShift = timeShift;
  
     }
     double getTimeShift() const {
         return timeShiftPackets.timeShift;
     }
     struct TimeShiftPackets {
         double timeShift;
     }
     interface Name(TimeShiftPackets)
     {
         void setTimeShift(double timeShift);
         double getTimeShift() const;
         TimeShiftPackets timeShiftPackets;
     }
     interface EncapsulationType(Frame2)
     {
         void encapsulate(Ethernet eth);
     }
     interface Lo(agent_zero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
     }
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }

   interface TimeDeltaPreviews(AgentZero)
   {
    
     void setTimeDeltas(const vector deltas);
     const getDeltas() const;
     TimeDeltaPreviews timeDeltaPreviews;
     void setTimeDeltas(const vector deltas) {
        timeDeltaPreviews.deltas = deltas;
     }
     const getDeltas() const {
         return timeDeltaPreviews.deltas;
     }
     struct TimeDeltaPreviews {
         vector deltas;
     }
     interface Name(TimeDeltaPreviews)
     {
         void setTimeDeltas(const vector deltas);
         const getDeltas() const;
         TimeDeltaPreviews timeDeltaPreviews;
     }
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }
   interface Frame2Encapsulation(AgentZero)
   {
    
     void encapsulate(Frame2 frame);
     Frame2 decapsulate() const;
     Frame2Encapsulation frame2Encapsulation;
     void encapsulate(Frame2 frame) {
        frame2Encapsulation.frame = frame;
     }
     Frame2 decapsulate() const {
         return frame2Encapsulation.frame;
     }
     struct Frame2Encapsulation {
         Frame2 frame;
     }
     interface Name(Frame2Encapsulation)
     {
         void encapsulate(Frame2 frame);
         Frame2 decapsulate() const;
         Frame2Encapsulation frame2Encapsulation;
     }
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }
   interface TimeDeltaPreviews(AgentZero, TimeDelta,  Packets)
   {
    
     void addTimeDelta(double timeDelta);
     const getTimeDeltas() const;
     TimeDeltaPreviews timeDeltaPreviews;
     void addTimeDelta(double timeDelta) {
        timeDeltaPreviews.deltas.push_back(timeDelta);
     }
     const getTimeDeltas() const {
         return timeDeltaPreviews.deltas;
     }
     struct TimeDeltaPreviews {
         vector deltas;
     }

   }
   interface Name(TimeDeltaPreviews)
   {
       void addTimeDelta(double timeDelta);
       const getTimeDeltas() const;
       TimeDeltaPreviews timeDeltaPreviews;
       void addTimeDelta(double timeDelta) {
        timeDeltaPreviews.deltas.push_back(timeDelta);
     }
     const getTimeDeltas() const {
         return timeDeltaPreviews.deltas;
     }
     struct TimeDeltaPreviews {
         vector deltas;
     }
   }

   interface TimeSincePreviews
   {
     
     void addTimeSince(double timeSince);
     const getTimeSince() const;
     TimeSincePreviews timeSincePreviews;
     void addTimeSince(double timeSince) {
        timeSincePreviews.times.push_back(timeSince);
     }
     const getTimeSince() const {
         return timeSincePreviews.times;
     }
     struct TimeSincePreviews {
         vector times;
     }
     interface Name(TimeSincePreviews)
     {
         void addTimeSince(double timeSince);
         const getTimeSince() const;
         TimeSincePreviews timeSincePreviews;
         void addTimeSince(double timeSince) {
        timeSincePreviews.times.push_back(timeSince);
     }
     const getTimeSince() const {
         return timeSincePreviews.times;
     }
     }
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
   }
   interface TimeSincePreviews(AgentZero, TimeDelta,  Packets)
   {
     
     void addTimeSince(double timeSince);
     const getTimeSince() const;
     TimeSincePreviews timeSincePreviews;
     void addTimeSince(double timeSince) {
        timeSincePreviews.times.push_back(timeSince);
     }
     const getTimeSince() const {
         return timeSincePreviews.times;
     }
     struct TimeSincePreviews {
         vector times;
     }

   
   interface Name(TimeSincePreviews)
     {
         void addTimeSince(double timeSince);
         const getTimeSince() const;
         TimeSincePreviews timeSincePreviews;
         void addTimeSince(double timeSince) {
        timeSincePreviews.times.push_back(timeSince);
     }
     const getTimeSince() const {
         return timeSincePreviews.times;
     }
     }
     interface EncapsulationType(Frame2)
     {
         void encapsulate(Ethernet eth);
     }
     interface Lo(agent_zero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
     
     }
   }

   interface FrameNumber2
   {
    
     int getFrameNumber() const;
     FrameNumber2 frameNumber2;
     int getFrameNumber() const {
         return frameNumber2.number;
     }
     struct FrameNumber2 {
         int number;
     }
     interface Name(FrameNumber2)
     {
         int getFrameNumber() const;
         FrameNumber2 frameNumber2;
     }
     interface EncapsulationType(Ethernet)
     {
         void encapsulate(Frame2 frame);
     }
     interface Lo(agent_zero)
     {
         void draw(Frame2 frame);
         void setWireColor(byte color);
         void captureScreen(const char* filename) const;
         Frame2 crop(int x, int y, int w, int h) const;
         Frame2 resize(int newWidth, int newHeight) const;
         int getPixel(int x, int y) const;
         void setPixel(int x, int y, byte color);
         void drawLine(int x0, int y0, int x1, int y1);
         void drawCircle(int x0, int y0, int radius);
  
     }
   }

   interface AgentZero
   {
     
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     void addPacket(Packet packet);
     const getPackets() const;
     AgentZero agentZero;
     void addPacket(Packet packet) {
        agentZero.packets.push_back(packet);
     }
     const getPackets() const {
         return agentZero.packets;
     }
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       void addPacket(Packet packet);
       const getPackets() const;
       AgentZero agentZero;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
   }
   interface Lo(agent_zero)
   {
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     Frame2 crop(int x, int y, int w, int h) const;
     Frame2 resize(int newWidth, int newHeight) const;
     int getPixel(int x, int y) const;
     void setPixel(int x, int y, byte color);
     void drawLine(int x0, int y0, int x1, int y1);
     void drawCircle(int x0, int y0, int radius);
   
   }
   interface AgentZero
   {
     
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     void addPacket(Packet packet);
     const getPackets() const;
     AgentZero agentZero;
     void addPacket(Packet packet) {
        agentZero.packets.push_back(packet);
     }
     const getPackets() const {
         return agentZero.packets;
     }
   
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       void addPacket(Packet packet);
       const getPackets() const;
       AgentZero agentZero;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
   }
   interface Lo(agent_zero)
   {
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     Frame2 crop(int x, int y, int w, int h) const;
     Frame2 resize(int newWidth, int newHeight) const;
     int getPixel(int x, int y) const;
     void setPixel(int x, int y, byte color);
     void drawLine(int x0, int y0, int x1, int y1);
     void drawCircle(int x0, int y0, int radius);
   
   
   }
   interface AgentZero
   {
     
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     void addPacket(Packet packet);
     const getPackets() const;
     AgentZero agentZero;
     void addPacket(Packet packet) {
        agentZero.packets.push_back(packet);
     }
     const getPackets() const {
         return agentZero.packets;
     }
   
   
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       void addPacket(Packet packet);
       const getPackets() const;
       AgentZero agentZero;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
   }
   interface Lo(agent_zero)
   {
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     Frame2 crop(int x, int y, int w, int h) const;
     Frame2 resize(int newWidth, int newHeight) const;
     int getPixel(int x, int y) const;
     void setPixel(int x, int y, byte color);
     void drawLine(int x0, int y0, int x1, int y1);
     void drawCircle(int x0, int y0, int radius);
   
   
   
   }
   interface AgentZero
   {
     
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     void addPacket(Packet packet);
     const getPackets() const;
     AgentZero agentZero;
     void addPacket(Packet packet) {
        agentZero.packets.push_back(packet);
     }
     const getPackets() const {
         return agentZero.packets;
     }
   
   
   
   
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       void addPacket(Packet packet);
       const getPackets() const;
       AgentZero agentZero;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
   }

   interface FrameLength(Frame, Length)
   {
    
     int getLength() const;
     FrameLength frameLength;
     int getLength() const {
         return frameLength.length;
     }
     struct FrameLength {
         int length;
     }
   }
   interface Name(FrameLength)
   {
       int getLength() const;
       FrameLength frameLength;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
   }
   interface Lo(agent_zero)
   {
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     Frame2 crop(int x, int y, int w, int h) const;
     Frame2 resize(int newWidth, int newHeight) const;
     int getPixel(int x, int y) const;
     void setPixel(int x, int y, byte color);
     void drawLine(int x0, int y0, int x1, int y1);
     void drawCircle(int x0, int y0, int radius);
   
   
   }
   interface AgentZero
   {
     
     void draw(Frame2 frame);
     void setWireColor(byte color);
     void captureScreen(const char* filename) const;
     void addPacket(Packet packet);
     const getPackets() const;
     AgentZero agentZero;
     void addPacket(Packet packet) {
        agentZero.packets.push_back(packet);
     }
     const getPackets() const {
         return agentZero.packets;
     }
   
   
   
   
   
   }
   interface Name(AgentZero)
   {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       void addPacket(Packet packet);
       const getPackets() const;
       AgentZero agentZero;
   }
   interface EncapsulationType(Frame2)
   {
     void encapsulate(Ethernet eth);
     }
     interface Lo(agent_zero)
     {
       void draw(Frame2 frame);
       void setWireColor(byte color);
       void captureScreen(const char* filename) const;
       Frame2 crop(int x, int y, int w, int h) const;
       Frame2 resize(int newWidth, int newHeight) const;
       int getPixel(int x, int y) const;
       void setPixel(int x, int y, byte color); 
     }
     
}