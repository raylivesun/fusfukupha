module matrix.gnu.bin.dirdaxauts.lozamas;

import std.math;
import std.algorithm;

struct Frame1 {
      byte a[95];
      byte b[760];
      byte c[95];

      void initPackets(byte a, byte b, byte c) (ref auto init) @param {
        this.a = a;
        this.b = b;
        this.c = c;
        init = this;
      }

      void encode(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void decode(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void mix(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void unmix(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void scramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      
      }
      void unscramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void daxauts(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      
      }
      void undaxauts(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void lozamas(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      
      }
      void unlozamas(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
      }
      void daxauts_lozamas(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        lozamas(buf, offset);
      }
      void undaxauts_lozamas(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        unlozamas(buf, offset);
      }
      void lozamas_daxauts(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        daxauts(buf, offset);
      }
      void unlozamas_daxauts(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        undaxauts(buf, offset);
      }
      void daxauts_lozamas_scramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        lozamas(buf, offset);
        scramble(buf, offset);
      }
      void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        unlozamas(buf, offset);
        unscramble(buf, offset);
      }
      void lozamas_daxauts_scramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        daxauts(buf, offset);
        scramble(buf, offset);
      }
      void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        undaxauts(buf, offset);
        unscramble(buf, offset);
      }
      void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        lozamas(buf, offset);
        scramble(buf, offset);
        unmix(buf, offset);
      }
      void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        undaxauts(buf, offset);
        unscramble(buf, offset);
        unmix(buf, offset);
      }
      void daxauts_lozamas_scramble_unmix(ref byte[] buf, size_t offset) {
        for (size_t i = 0; i < 95; ++i) {
            buf[offset + i] = a[i] ^ b[i] ^ c[i];
        }
        daxauts(buf, offset);
        scramble(buf, offset);
        unmix(buf, offset);
      }

      interface Id(agent_zero)
      {
        void initPackets(byte a, byte b, byte c);
        void encode(ref byte[] buf, size_t offset);
        void decode(ref byte[] buf, size_t offset);
        void mix(ref byte[] buf, size_t offset);
        void unmix(ref byte[] buf, size_t offset);
        void scramble(ref byte[] buf, size_t offset);
        void unscramble(ref byte[] buf, size_t offset);
        void daxauts(ref byte[] buf, size_t offset);
        void undaxauts(ref byte[] buf, size_t offset);
        void lozamas(ref byte[] buf, size_t offset);
        void unlozamas(ref byte[] buf, size_t offset);
        void daxauts_lozamas(ref byte[] buf, size_t offset);
        void undaxauts_lozamas(ref byte[] buf, size_t offset);
        void lozamas_daxauts(ref byte[] buf, size_t offset);
        void unlozamas_daxauts(ref byte[] buf, size_t offset);
        void daxauts_lozamas_scramble(ref byte[] buf, size_t offset);
        void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset);
        void lozamas_daxauts_scramble(ref byte[] buf, size_t offset);
        void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset);
        void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset);
        void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset);
        void daxauts_lozamas_scramble_unmix(ref byte[] buf, size_t offset);
      }
      class AgentOne : agent_zero
      {
        public byte a, b, c;
        public void initPackets(byte a, byte b, byte c)
        {
            this.a = a;
            this.b = b;
            this.c = c;
  
        }
        public void encode(ref byte[] buf, size_t offset)
        {
          buf[offset + 0] = a;
          buf[offset + 1] = b;
          buf[offset + 2] = c;
        }
        public void decode(ref byte[] buf, size_t offset)
        {
          a = buf[offset + 0];
          b = buf[offset + 1];
          c = buf[offset + 2];
        }
        public void mix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unscramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void undaxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unlozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void daxauts_lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void undaxauts_lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void lozamas_daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unlozamas_daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }

        public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void daxauts_lozamas_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
      }
      class AgentTwo : agent_zero
      {
        public byte a, b, c;
        public void initPackets(byte a, byte b, byte c)
        {
            this.a = a;
            this.b = b;
            this.c = c;
        }
        public void encode(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        }
        public void decode(ref byte[] buf, size_t offset)
        {
            a = buf[offset + 0];
            b = buf[offset + 1];
            c = buf[offset + 2];
        }
        public void mix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        }
        public void unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        }
        public void scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void unscramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        }
        public void daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void undaxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void unlozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        }
        public void daxauts_lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void undaxauts_lozamas(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void lozamas_daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void unlozamas_daxauts(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        
        }
        public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        }
        public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        
        }
        public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        
        }
        public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        
        
            }
        public void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        }
        public void daxauts_lozamas_scramble_unmix(ref byte[] buf, size_t offset)
        {
            buf[offset + 0] = a;
            buf[offset + 1] = b;
            buf[offset + 2] = c;
        
        
        
        }
      }
      class Program
      {
        static void main(string[] args)
        {
            AgentOne agent1 = new AgentOne();
            AgentTwo agent2 = new AgentTwo();
            
            byte[] buf = new byte[3];
            
            agent1.initPackets(1, 2, 3);
            agent2.initPackets(4, 5, 6);
            
            agent1.encode(buf, 0);
            agent2.decode(buf, 0);
            
            }
      }
      class EncapsulationEthernet
      {
         public void encode(ref byte[] buf, size_t offset){
            agent1.encode(buf, offset);
            agent2.encode(buf, offset + 12);
         }
         public void decode(ref byte[] buf, size_t offset){
            agent1.decode(buf, offset);
            agent2.decode(buf, offset + 12);
         }
         public void mix(ref byte[] buf, size_t offset){
            agent1.mix(buf, offset);
            agent2.mix(buf, offset + 12);
         }
         public void unmix(ref byte[] buf, size_t offset){
            agent1.unmix(buf, offset);
            agent2.unmix(buf, offset + 12);
   
        }
         public void scramble(ref byte[] buf, size_t offset){
            agent1.scramble(buf, offset);
            agent2.scramble(buf, offset + 12);
         }
         public void unscramble(ref byte[] buf, size_t offset){
            agent1.unscramble(buf, offset);
            agent2.unscramble(buf, offset + 12);
   
       }
         public void daxauts(ref byte[] buf, size_t offset){
            agent1.daxauts(buf, offset);
            agent2.daxauts(buf, offset + 12);
         }
         public void undaxauts(ref byte[] buf, size_t offset){
            agent1.undaxauts(buf, offset);
            agent2.undaxauts(buf, offset + 12);
   
 
         }
         public void lozamas(ref byte[] buf, size_t offset){
            agent1.lozamas(buf, offset);
            agent2.lozamas(buf, offset + 12);
         }
         public void unlozamas(ref byte[] buf, size_t offset){
            agent1.unlozamas(buf, offset);
            agent2.unlozamas(buf, offset + 12);
   
   
     }
         public void daxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas(buf, offset);
            agent2.daxauts_lozamas(buf, offset + 12);
   
     }
         public void undaxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas(buf, offset);
            agent2.undaxauts_lozamas(buf, offset + 12);
   
   

     }
         public void lozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts(buf, offset);
            agent2.lozamas_daxauts(buf, offset + 12);
   

     }
         public void unlozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts(buf, offset);
            agent2.unlozamas_daxauts(buf, offset + 12);
   
   


     }
         public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas_scramble(buf, offset);
            agent2.daxauts_lozamas_scramble(buf, offset + 12);
   

     }
         public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas_scramble(buf, offset);
            agent2.undaxauts_lozamas_scramble(buf, offset + 12);
   
   



     }
         public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble(buf, offset);
            agent2.lozamas_daxauts_scramble(buf, offset + 12);
   



    }
         public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble(buf, offset);
            agent2.unlozamas_daxauts_scramble(buf, offset + 12);
         }
         public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble_unmix(buf, offset);
            agent2.lozamas_daxauts_scramble_unmix(buf, offset + 12);
         }
         public void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble_unmix(buf, offset);
            agent2.unlozamas_daxauts_scramble_unmix(buf, offset + 12);
   
     }
      }
      class EncapsulationIP
      {
         public void encode(ref byte[] buf, size_t offset){
            agent1.encode(buf, offset);
            agent2.encode(buf, offset + 20);
         }
         public void decode(ref byte[] buf, size_t offset){
            agent1.decode(buf, offset);
            agent2.decode(buf, offset + 20);
   
     }
         public void mix(ref byte[] buf, size_t offset){
            agent1.mix(buf, offset);
            agent2.mix(buf, offset + 20);
   

     }
         public void unmix(ref byte[] buf, size_t offset){
            agent1.unmix(buf, offset);
            agent2.unmix(buf, offset + 20);
   


     }
         public void scramble(ref byte[] buf, size_t offset){
            agent1.scramble(buf, offset);
            agent2.scramble(buf, offset + 20);
   



     }
         public void unscramble(ref byte[] buf, size_t offset){
            agent1.unscramble(buf, offset);
            agent2.unscramble(buf, offset + 20);
   


     }
         public void daxauts(ref byte[] buf, size_t offset){
            agent1.daxauts(buf, offset);
            agent2.daxauts(buf, offset + 20);
         }
         public void undaxauts(ref byte[] buf, size_t offset){
            agent1.undaxauts(buf, offset);
            agent2.undaxauts(buf, offset + 20);
         }
         public void lozamas(ref byte[] buf, size_t offset){
            agent1.lozamas(buf, offset);
            agent2.lozamas(buf, offset + 20);
         }
         public void unlozamas(ref byte[] buf, size_t offset){
            agent1.unlozamas(buf, offset);
            agent2.unlozamas(buf, offset + 20);
   



     }
         public void daxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas(buf, offset);
            agent2.daxauts_lozamas(buf, offset + 20);
         }
         public void undaxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas(buf, offset);
            agent2.undaxauts_lozamas(buf, offset + 20);
         }
         public void lozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts(buf, offset);
            agent2.lozamas_daxauts(buf, offset + 20);
         }
         public void unlozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts(buf, offset);
            agent2.unlozamas_daxauts(buf, offset + 20);
         }
         public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas_scramble(buf, offset);
            agent2.daxauts_lozamas_scramble(buf, offset + 20);
         }
         public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas_scramble(buf, offset);
            agent2.undaxauts_lozamas_scramble(buf, offset + 20);
         }
         public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble(buf, offset);
            agent2.lozamas_daxauts_scramble(buf, offset + 20);
         }
         public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble(buf, offset);
            agent2.unlozamas_daxauts_scramble(buf, offset + 20);
         }
         public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble_unmix(buf, offset);
            agent2.lozamas_daxauts_scramble_unmix(buf, offset + 20);
         }
         public void unlozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble_unmix(buf, offset);
            agent2.unlozamas_daxauts_scramble_unmix(buf, offset + 20);
         }
         public void lozamas_daxauts_scramble_unmix_unmix(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble_unmix_unmix(buf, offset);
            agent2.lozamas_daxauts_scramble_unmix_unmix(buf, offset + 20);
         }
         public void unlozamas_daxauts_scramble_unmix_unmix(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble_unmix_unmix(buf, offset);
            agent2.unlozamas_daxauts_scramble_unmix_unmix(buf, offset + 20);
         }

         interface ArrivalTimes
         {
            void calculate_arrival_times(double[] arrTimes, int numAgents);
            void calculate_arrival_times_unmix(double[] arrTimes, int numAgents);
            void calculate_arrival_times_scramble_unmix(double[] arrTimes, int numAgents);
            void calculate_arrival_times_scramble_unmix_unmix(double[] arrTimes, int numAgents);
            
         }   

      }
      class EncapsulationTCP
      {
         public void encode(ref byte[] buf, size_t offset){
            agent1.encode(buf, offset);
            agent2.encode(buf, offset + 20);
         }
         public void decode(ref byte[] buf, size_t offset){
            agent1.decode(buf, offset);
            agent2.decode(buf, offset + 20);
   


     }
         public void mix(ref byte[] buf, size_t offset){
            agent1.mix(buf, offset);
            agent2.mix(buf, offset + 20);
   



     }
         public void unmix(ref byte[] buf, size_t offset){
            agent1.unmix(buf, offset);
            agent2.unmix(buf, offset + 20);
         }
         public void scramble(ref byte[] buf, size_t offset){
            agent1.scramble(buf, offset);
            agent2.scramble(buf, offset + 20);
         }
         public void unscramble(ref byte[] buf, size_t offset){
            agent1.unscramble(buf, offset);
            agent2.unscramble(buf, offset + 20);
         }
         public void daxauts(ref byte[] buf, size_t offset){
            agent1.daxauts(buf, offset);
            agent2.daxauts(buf, offset + 20);
   
     }
         public void undaxauts(ref byte[] buf, size_t offset){
            agent1.undaxauts(buf, offset);
            agent2.undaxauts(buf, offset + 20);
         }
         public void lozamas(ref byte[] buf, size_t offset){
            agent1.lozamas(buf, offset);
            agent2.lozamas(buf, offset + 20);
   
     }
         public void unlozamas(ref byte[] buf, size_t offset){
            agent1.unlozamas(buf, offset);
            agent2.unlozamas(buf, offset + 20);
         }
         public void daxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas(buf, offset);
            agent2.daxauts_lozamas(buf, offset + 20);
   
     }
         public void undaxauts_lozamas(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas(buf, offset);
            agent2.undaxauts_lozamas(buf, offset + 20);
   
     }
         public void lozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts(buf, offset);
            agent2.lozamas_daxauts(buf, offset + 20);
   

     }
         public void unlozamas_daxauts(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts(buf, offset);
            agent2.unlozamas_daxauts(buf, offset + 20);
   

     }
         public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.daxauts_lozamas_scramble(buf, offset);
            agent2.daxauts_lozamas_scramble(buf, offset + 20);
   


     }
         public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset){
            agent1.undaxauts_lozamas_scramble(buf, offset);
            agent2.undaxauts_lozamas_scramble(buf, offset + 20);
         }
         public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble(buf, offset);
            agent2.lozamas_daxauts_scramble(buf, offset + 20);
   



     }
         public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            agent1.unlozamas_daxauts_scramble(buf, offset);
            agent2.unlozamas_daxauts_scramble(buf, offset + 20);
         }
         public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
            agent1.lozamas_daxauts_scramble_unmix(buf, offset);
            agent2.lozamas_daxauts_scramble_unmix(buf, offset + 20);
         }

      }

      interface EpochArrivalTimes
      {
         void calculate_epoch_arrival_times(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_unmix(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_scramble_unmix(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_scramble_unmix_unmix(double[] arrTimes, int numAgents);
      }
   }
   class Agents
   {
      public class Agent1 : Agents.Agent
      {
         public void encode(ref byte[] buf, size_t offset){
            // Agent1 encoding logic goes here
         }
         public void decode(ref byte[] buf, size_t offset){
            // Agent1 decoding logic goes here
         }
         public void mix(ref byte[] buf, size_t offset){
            // Agent1 mixing logic goes here
         }
         public void unmix(ref byte[] buf, size_t offset){
            // Agent1 unmixing logic goes here
         }
         public void scramble(ref byte[] buf, size_t offset){
            // Agent1 scrambling logic goes here
         }
         public void unscramble(ref byte[] buf, size_t offset){
            // Agent1 unscrambling logic goes here
         }
         public void daxauts(ref byte[] buf, size_t offset){
            // Agent1 Daxauts logic goes here
         }
         public void undaxauts(ref byte[] buf, size_t offset){
            // Agent1 undaxauts logic goes here
         }
         public void lozamas(ref byte[] buf, size_t offset){
            // Agent1 Lozamas logic goes here
         }
         public void unlozamas(ref byte[] buf, size_t offset){
            // Agent1 unlozamas logic goes here
         }
         public void daxauts_lozamas(ref byte[] buf, size_t offset){
            // Agent1 Daxauts Lozamas logic goes here
         }
         public void undaxauts_lozamas(ref byte[] buf, size_t offset){
            // Agent1 undaxauts Lozamas logic goes here
         }
         public void lozamas_daxauts(ref byte[] buf, size_t offset){
            // Agent1 Lozamas Daxauts logic goes here
         }
         public void unlozamas_daxauts(ref byte[] buf, size_t offset){
            // Agent1 unlozamas Daxauts logic goes here
         }
         public void daxauts_lozamas_scramble(ref byte[] buf, size_t offset){
             // Agent1 Daxauts Lozamas Scramble logic goes here
         }
         public void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset){
             // Agent1 undaxauts Lozamas Scramble logic goes here
         }
         public void lozamas_daxauts_scramble(ref byte[] buf, size_t offset){
            // Agent1 Lozamas Daxauts Scramble logic goes here
         }
         public void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset){
             // Agent1 unlozamas Daxauts Scramble logic goes here
         }
         public void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset){
             // Agent1 Lozamas Daxauts Scramble Unmix logic goes here
         }
    
       }

       interface TimesShiftToPackets
       {
         void shift_times_to_packets(double[] arrTimes, int numAgents);
         void shift_times_to_packets_unmix(double[] arrTimes, int numAgents);
         void shift_times_to_packets_scramble_unmix(double[] arrTimes, int numAgents);
         void shift_times_to_packets_scramble_unmix_unmix(double[] arrTimes, int numAgents);
       }
       interface EpochArrivalTimes
       {
         void calculate_epoch_arrival_times(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_unmix(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_scramble_unmix(double[] arrTimes, int numAgents);
         void calculate_epoch_arrival_times_scramble_unmix_unmix(double[] arrTimes, int numAgents);
       }

      interface TimesDeltaToPackets
      {
         void delta_times_to_packets(double[] arrTimes, int numAgents);
         void delta_times_to_packets_unmix(double[] arrTimes, int numAgents);
         void delta_times_to_packets_scramble_unmix(double[] arrTimes, int numAgents);
         void delta_times_to_packets_scramble_unmix_unmix(double[] arrTimes, int numAgents);
      }
     class Agent2 : Agents.Agent
      {
         // Agent2 implementation goes here
      }

      interface TimesDeltaToPreviewsPackets
      {
         void delta_times_to_preview_packets(double[] arrTimes, int numAgents);
         void delta_times_to_preview_packets_unmix(double[] arrTimes, int numAgents);
         void delta_times_to_preview_packets_scramble_unmix(double[] arrTimes, int numAgents);
         void delta_times_to_preview_packets_scramble_unmix_unmix(double[] arrTimes, int numAgents);
      }
   }
   interface Agents
   {
      interface Agent
      {
         void encode(ref byte[] buf, size_t offset);
         void decode(ref byte[] buf, size_t offset);
         void mix(ref byte[] buf, size_t offset);
         void unmix(ref byte[] buf, size_t offset);
         void scramble(ref byte[] buf, size_t offset);
         void unscramble(ref byte[] buf, size_t offset);
         void daxauts(ref byte[] buf, size_t offset);
         void undaxauts(ref byte[] buf, size_t offset);
         void lozamas(ref byte[] buf, size_t offset);
         void unlozamas(ref byte[] buf, size_t offset);
         void daxauts_lozamas(ref byte[] buf, size_t offset);
         void undaxauts_lozamas(ref byte[] buf, size_t offset);
         void lozamas_daxauts(ref byte[] buf, size_t offset);
         void unlozamas_daxauts(ref byte[] buf, size_t offset);
         void daxauts_lozamas_scramble(ref byte[] buf, size_t offset);
         void undaxauts_lozamas_scramble(ref byte[] buf, size_t offset);
         void lozamas_daxauts_scramble(ref byte[] buf, size_t offset);
         void unlozamas_daxauts_scramble(ref byte[] buf, size_t offset);
         void lozamas_daxauts_scramble_unmix(ref byte[] buf, size_t offset);
      }

   interface TimeSincesReferences
   {
    
     void calculate_time_since_references(double[] arrTimes, int numAgents);
     void calculate_time_since_references_unmix(double[] arrTimes, int numAgents);
     void calculate_time_since_references_scramble_unmix(double[] arrTimes, int numAgents);
     void calculate_time_since_references_scramble_unmix_unmix(double[] arrTimes, int numAgents);
   }
   }
   class Agents
   {
      interface Agent
      {
         void encode(ref byte[] buf, size_t offset);
         void decode(ref byte[] buf, size_t offset);
         void mix(ref byte[] buf, size_t offset);
         void unmix(ref byte[] buf, size_t offset);
         void scramble(ref byte[] buf, size_t offset);
         void unscramble(ref byte[] buf, size_t offset);
      }

}

struct FrameNumber1 {
    size_t value;
    explicit frameNumber1(size_t v);
    operator size_t() const { return value; }
    bool operator(const frameNumber1 other) const { return value == other.value; }
    bool operator(const frameNumber1 other) const { return!(*this == other); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value + other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value - other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value + other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value - other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value * other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value / other.value); }
    frameNumber1 operator(const frameNumber1 other) const { return frameNumber1(value % other.value); }
}

struct FrameLength {
    size_t value;
    explicit frameLength(size_t v);
    operator size_t() const { return value; }
    bool operator(const frameLength other) const { return value == other.value; }
    bool operator(const frameLength other) const { return!(*this == other); }
    frameLength operator(const frameLength other) const { return frameLength(value + other.value); }
    frameLength operator(const frameLength other) const { return frameLength(value - other.value); }
    frameLength operator(const frameLength other) const { return frameLength(value * other.value); }
    frameLength operator(const frameLength other) const { return frameLength(value / other.value); }
    frameLength operator(const frameLength other) const { return frameLength(value % other.value); }
}

struct FrameTime {
    double value;
    explicit frameTime(double v);
    bool operator(const frameTime other) const { return value == other.value; }
    bool operator(const frameTime other) const { return!(*this == other); }
    frameTime operator(const frameTime other) const { return frameTime(value + other.value); }
    frameTime operator(const frameTime other) const { return frameTime(value - other.value); }
    frameTime operator(const frameTime other) const { return frameTime(value * other.value); }
    frameTime operator(const frameTime other) const { return frameTime(value / other.value); }
    frameTime operator(const frameTime other) const { return frameTime(value % other.value); }
}

struct CaptureLength {
    size_t value;
    explicit captureLength(size_t v);
    operator size_t() const { return value; }
    bool operator(const captureLength other) const { return value == other.value; }
    bool operator(const captureLength other) const { return!(*this == other); }
    captureLength operator(const captureLength other) const { return captureLength(value + other.value); }
    captureLength operator(const captureLength other) const { return captureLength(value - other.value); }
    captureLength operator(const captureLength other) const { return captureLength(value * other.value); }
    captureLength operator(const captureLength other) const { return captureLength(value / other.value); }
    captureLength operator(const captureLength other) const { return captureLength(value % other.value); }
}

struct CaptureTime {
    double value;
    explicit captureTime(double v);
    bool operator(const captureTime other) const { return value == other.value; }
    bool operator(const captureTime other) const { return!(*this == other); }
    captureTime operator(const captureTime other) const { return captureTime(value + other.value); }
    captureTime operator(const captureTime other) const { return captureTime(value - other.value); }
    captureTime operator(const captureTime other) const { return captureTime(value * other.value); }
    captureTime operator(const captureTime other) const { return captureTime(value / other.value); }
    captureTime operator(const captureTime other) const { return captureTime(value % other.value); }
}

struct PacketLength {
    size_t value;
    explicit packetLength(size_t v);
    operator size_t() const { return value; }
    bool operator(const PacketLength other) const { return value == other.value; }
    bool operator(const PacketLength other) const { return!(*this == other); }
    PacketLength operator(const PacketLength other) const { return PacketLength(value + other.value); }
    PacketLength operator(const PacketLength other) const { return PacketLength(value - other.value); }
    PacketLength operator(const PacketLength other) const { return PacketLength(value * other.value); }
    PacketLength operator(const PacketLength other) const { return PacketLength(value / other.value); }
    PacketLength operator(const PacketLength other) const { return PacketLength(value % other.value); }
}

struct PacketTime {
    double value;
    explicit packetTime(double v);
    bool operator(const PacketTime other) const { return value == other.value; }
    bool operator(const PacketTime other) const { return!(*this == other); }
    PacketTime operator(const PacketTime other) const { return PacketTime(value + other.value); }
    PacketTime operator(const PacketTime other) const { return PacketTime(value - other.value); }
    PacketTime operator(const PacketTime other) const { return PacketTime(value * other.value); }
    PacketTime operator(const PacketTime other) const { return PacketTime(value / other.value); }
    PacketTime operator(const PacketTime other) const { return PacketTime(value % other.value); }
}

struct TimeSinceReference {
    double value;
    explicit timeSinceReference(double v);
    bool operator(const TimeSinceReference other) const { return value == other.value; }
    bool operator(const TimeSinceReference other) const { return!(*this == other); }
    TimeSinceReference operator(const TimeSinceReference other) 
    const { return TimeSinceReference(value + other.value); }
    TimeSinceReference operator(const TimeSinceReference other) 
    const { return TimeSinceReference(value - other.value); }
    TimeSinceReference operator(const TimeSinceReference other) 
    const { return TimeSinceReference(value * other.value); }
    TimeSinceReference operator(const TimeSinceReference other) 
    const { return TimeSinceReference(value / other.value); }
    TimeSinceReference operator(const TimeSinceReference other) 
    const { return TimeSinceReference(value % other.value); }
}

struct TimeUntilNextReference {
    double value;
    explicit timeUntilNextReference(double v);
    bool operator(const TimeUntilNextReference other) const { return value == other.value; }
    bool operator(const TimeUntilNextReference other) const { return!(*this == other); }
    TimeUntilNextReference operator(const TimeUntilNextReference other) 
    const { return TimeUntilNextReference(value + other.value); }
    TimeUntilNextReference operator(const TimeUntilNextReference other) 
    const { return TimeUntilNextReference(value - other.value); }
    TimeUntilNextReference operator(const TimeUntilNextReference other) 
    const { return TimeUntilNextReference(value * other.value); }
    TimeUntilNextReference operator(const TimeUntilNextReference other) 
    const { return TimeUntilNextReference(value / other.value); }
    TimeUntilNextReference operator(const TimeUntilNextReference other) 
    const { return TimeUntilNextReference(value % other.value); }
}

struct TimeSinceLastReference {
    double value;
    explicit timeSinceLastReference(double v);
    bool operator(const TimeSinceLastReference other) 
    const { return value == other.value; }
    bool operator(const TimeSinceLastReference other) 
    const { return!(*this == other); }
    TimeSinceLastReference operator(const TimeSinceLastReference other) 
    const { return TimeSinceLastReference(value + other.value); }
    TimeSinceLastReference operator(const TimeSinceLastReference other) 
    const { return TimeSinceLastReference(value - other.value); }
    TimeSinceLastReference operator(const TimeSinceLastReference other) 
    const { return TimeSinceLastReference(value * other.value); }
    TimeSinceLastReference operator(const TimeSinceLastReference other) 
    const { return TimeSinceLastReference(value / other.value); }
    TimeSinceLastReference operator(const TimeSinceLastReference other) 
    const { return TimeSinceLastReference(value % other.value); }
}

struct TimeUntilNextFrame {
    double value;
    explicit timeUntilNextFrame(double v);
    bool operator(const TimeUntilNextFrame other) 
    const { return value == other.value; }
    bool operator(const TimeUntilNextFrame other) 
    const { return!(*this == other); }
    TimeUntilNextFrame operator(const TimeUntilNextFrame other) 
    const { return TimeUntilNextFrame(value + other.value); }
    TimeUntilNextFrame operator(const TimeUntilNextFrame other) 
    const { return TimeUntilNextFrame(value - other.value); }
    TimeUntilNextFrame operator(const TimeUntilNextFrame other) 
    const { return TimeUntilNextFrame(value * other.value); }
    TimeUntilNextFrame operator(const TimeUntilNextFrame other) 
    const { return TimeUntilNextFrame(value / other.value); }
    TimeUntilNextFrame operator(const TimeUntilNextFrame other) 
    const { return TimeUntilNextFrame(value % other.value); }
}


struct FrameMarked
{
    
    static constexpr FRAME_RATE = 30.0; // frames per second
    static constexpr FRAME_DURATION = 1.0 / FRAME_RATE; // seconds per frame
    static constexpr TIME_SCALE = 1000.0; // milliseconds per second

    frameLength frameNumber;
    frameTime timeStamp;
    CaptureLength captureNumber;
    CaptureTime captureTimeStamp;
    PacketLength packetNumber;
    PacketTime packetTimeStamp;
    TimeSinceReference timeSinceReference;
    TimeUntilNextReference timeUntilNextReference;
    TimeSinceLastReference timeSinceLastReference;
    TimeUntilNextFrame timeUntilNextFrame;
    // Add additional member variables as needed

    // Add constructors, getters, and setters as needed

    // Implement comparison operators for frameMarked objects
}

struct FrameIgnored {
    // Add member variables as needed

    // Add constructors, getters, and setters as needed

    // Implement comparison operators for FrameIgnored objects
    // Add any additional logic or methods as needed
    // Example: Calculate the average packet loss rate
    // Example: Determine if the frame is late based on a certain threshold
    // Example: Calculate the average packet latency
    // Example: Check if the frame contains specific data patterns
    // Example: Perform any additional processing or analysis on the frame
    // Example: Return a custom analysis result
    // Example: Store the frame in a database or file for further analysis
    // Example: Send the frame to a remote server for further processing
}

struct FrameProtocol {
    // Add member variables as needed

    // Add constructors, getters, and setters as needed

    // Implement comparison operators for FrameProtocol objects
    // Add any additional logic or methods as needed
    // Example: Calculate the average packet loss rate
    // Example: Determine if the frame is late based on a certain threshold
    // Example: Calculate the average packet latency
    // Example: Check if the frame contains specific data patterns
    // Example: Perform any additional processing or analysis on the frame
    // Example: Return a custom analysis result
    // Example: Store the frame in a database or file for further analysis
    // Example: Send the frame to a remote server for further processing
    // Example: Implement a custom frame processing algorithm
    // Example: Implement a custom frame validation algorithm
    // Example: Implement a custom frame encryption algorithm
    // Example: Implement a custom frame decryption algorithm
    // Example: Implement a custom frame compression algorithm
    // Example: Implement a custom frame decompression algorithm
    // Example: Implement a custom frame encryption/decryption/compression/decompression algorithm
    // Example: Implement a custom frame integrity check algorithm
    // Example: Implement a custom frame authentication algorithm
    // Example: Implement a custom frame authorization algorithm
    // Example: Implement a custom frame rate control algorithm
    // Example: Implement a custom frame quality control algorithm
    // Example: Implement a custom frame loss control algorithm
    // Example: Implement a custom frame duplication control algorithm
    // Example: Implement a custom frame redundancy control algorithm
    // Example: Implement a custom frame error correction algorithm
    // Example: Implement a custom frame reordering algorithm
    // Example: Implement a custom frame reassembly algorithm
    // Example: Implement a custom frame prioritization algorithm
    // Example: Implement a custom frame scheduling algorithm
    // Example: Implement a custom frame priority assignment algorithm
    // Example: Implement a custom frame priority adjustment algorithm
    // Example: Implement a custom frame priority inversion algorithm
    // Example: Implement a custom frame priority escalation algorithm
    // Example: Implement a custom frame priority degradation algorithm
    // Example: Implement a custom frame priority inheritance algorithm
    // Example: Implement a custom frame priority delegation algorithm
    // Example: Implement a custom frame priority delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration escalation algorithm
    // Example: Implement a custom frame priority reconfiguration degradation algorithm
    // Example: Implement a custom frame priority reconfiguration inheritance algorithm
    // Example: Implement a custom frame priority reconfiguration delegation algorithm
    // Example: Implement a custom frame priority reconfiguration delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration escalation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration degradation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration inheritance algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration delegation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration escalation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration degradation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration inheritance algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration delegation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration escalation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration degradation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration inheritance algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration delegation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration escalation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration degradation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration inheritance algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration delegation algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration delegation adjustment algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration algorithm
    // Example: Implement a custom frame priority reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration reconfiguration adjustment algorithm

}

interface ColoringRulesNames
{

    public const string red = "Red";
    public const string green = "Green";
    public const string blue = "Blue";
    public const string yellow = "Yellow";
    public const string magenta = "Magenta";
    public const string cyan = "Cyan";
    public const string white = "White";
    public const string black = "Black";
    public const string orange = "Orange";
    public const string purple = "Purple";
    public const string pink = "Pink";
    public const string brown = "Brown";
    public const string gray = "Gray";
    public const string silver = "Silver";
    public const string gold = "Gold";
    public const string maroon = "Maroon";
    public const string teal = "Teal";
    public const string lime = "Lime";
    public const string aqua = "Aqua";
    public const string fuchsia = "Fuchsia";
    public const string lavender = "Lavender";
    public const string sienna = "Sienna";
    public const string tan = "Tan";
    public const string peach = "Peach";

}

struct ColoringRuleString {

    public string name;
    public string hexCode;
    public string r;
    public string g;
    public string b;

}

struct EthernetIISrc {
    public string ethernetType;
    public string description;
    public string protocol;
    public string coloringRule;
    public string coloringRuleName;
    public string coloringRuleHexCode;
    public string coloringRuleRGB;
    public string coloringRuleRGBHexCode;
    public string coloringRuleHSL;
    public string coloringRuleHSLHexCode;
    public string coloringRuleCMYK;
    public string coloringRuleCMYKHexCode;
    public string coloringRuleHSV;
    public string coloringRuleHSVHexCode;
    public string coloringRuleYUV;
    public string coloringRuleYUVHexCode;
    public string coloringRuleYCbCr;
    public string coloringRuleYCbCrHexCode;
    public string coloringRuleYIQ;
    public string coloringRuleYIQHexCode;
    public string coloringRuleYPbPr;
    public string coloringRuleYPbPrHexCode;
    public string coloringRuleXYY;
    public string coloringRuleXYYHexCode;
    public string coloringRuleRGBToCMYK;
    public string coloringRuleRGBToCMYKHexCode;
    public string coloringRuleRGBToHSL;
    public string coloringRuleRGBToHSLHexCode;
    public string coloringRuleRGBToHSV;
    public string coloringRuleRGBToHSVHexCode;
    public string coloringRuleRGBToYUV;
    public string coloringRuleRGBToYUVHexCode;
    public string coloringRuleRGBToYCbCr;
    public string coloringRuleRGBToYCbCrHexCode;
}

struct Destination {
    public string destinationAddress;
    public string destinationDescription;
    public string destinationType;
    public string coloringRule;
    public string coloringRuleName;
    public string coloringRuleHexCode;
    public string coloringRuleRGB;
    public string coloringRuleRGBHexCode;
    public string coloringRuleHSL;
    public string coloringRuleHSLHexCode;
    public string coloringRuleCMYK;
    public string coloringRuleCMYKHexCode;
    public string coloringRuleHSV;
    public string coloringRuleHSVHexCode;
    public string coloringRuleYUV;
    public string coloringRuleYUVHexCode;
    public string coloringRuleYCbCr;
    public string coloringRuleYCbCrHexCode;
    public string coloringRuleYIQ;
    public string coloringRuleYIQHexCode;
    public string coloringRuleYPbPr;
    public string coloringRuleYPbPrHexCode;
    public string coloringRuleXYY;
    public string coloringRuleXYYHexCode;
    public string coloringRuleRGBToCMYK;
    public string coloringRuleRGBToCMYKHexCode;
    public string coloringRuleRGBToHSL;
    public string coloringRuleRGBToHSLHexCode;
    public string coloringRuleRGBToHSV;
    public string coloringRuleRGBToHSVHexCode;
    public string coloringRuleRGBToYUV;
    public string coloringRuleRGBToYUVHexCode;
    public string coloringRuleRGBToYCbCr;
    public string coloringRuleRGBToYCbCrHexCode;
    public string coloringRuleRGBToYIQ;
    public string coloringRuleRGBToYIQHexCode;
    
}

struct Source {
    public string sourceAddress;
    public string sourceDescription;
    public string sourceType;
    public string coloringRule;
    public string coloringRuleName;
    public string coloringRuleHexCode;
    public string coloringRuleRGB;
    public string coloringRuleRGBHexCode;
    public string coloringRuleHSL;
    public string coloringRuleHSLHexCode;
    public string coloringRuleCMYK;
    public string coloringRuleCMYKHexCode;
    public string coloringRuleHSV;
    public string coloringRuleHSVHexCode;
    public string coloringRuleYUV;
    public string coloringRuleYUVHexCode;
    public string coloringRuleYCbCr;
    public string coloringRuleYCbCrHexCode;
    public string coloringRuleYIQ;
    public string coloringRuleYIQHexCode;
    public string coloringRuleYPbPr;
    public string coloringRuleYPbPrHexCode;
    public string coloringRuleXYY;
    public string coloringRuleXYYHexCode;
    public string coloringRuleRGBToCMYK;
    public string coloringRuleRGBToCMYKHexCode;
    public string coloringRuleRGBToHSL;
    public string coloringRuleRGBToHSLHexCode;
    public string coloringRuleRGBToHSV;
    public string coloringRuleRGBToHSVHexCode;
    public string coloringRuleRGBToYUV;
    public string coloringRuleRGBToYUVHexCode;
    public string coloringRuleRGBToYCbCr;
    public string coloringRuleRGBToYCbCrHexCode;
    public string coloringRuleRGBToYIQ;
    public string coloringRuleRGBToYIQHexCode;
}

struct InternetProtocol {
    public string protocol;
    public string description;
    public string coloringRule;
    public string coloringRuleName;
    public string coloringRuleHexCode;
    public string coloringRuleRGB;
    public string coloringRuleRGBHexCode;
    public string coloringRuleHSL;
    public string coloringRuleHSLHexCode;
    public string coloringRuleCMYK;
    public string coloringRuleCMYKHexCode;
    public string coloringRuleHSV;
    public string coloringRuleHSVHexCode;
    public string coloringRuleYUV;
    public string coloringRuleYUVHexCode;
    public string coloringRuleYCbCr;
    public string coloringRuleYCbCrHexCode;
    public string coloringRuleYIQ;
    public string coloringRuleYIQHexCode;
    public string coloringRuleYPbPr;
    public string coloringRuleYPbPrHexCode;
    public string coloringRuleXYY;
    public string coloringRuleXYYHexCode;
    public string coloringRuleRGBToCMYK;
    public string coloringRuleRGBToCMYKHexCode;
    public string coloringRuleRGBToHSL;
    public string coloringRuleRGBToHSLHexCode;
    public string coloringRuleRGBToHSV;
    public string coloringRuleRGBToHSVHexCode;
    public string coloringRuleRGBToYUV;
    public string coloringRuleRGBToYUVHexCode;
    public string coloringRuleRGBToYCbCr;
    public string coloringRuleRGBToYCbCrHexCode;
    public string coloringRuleRGBToYIQ;
    public string coloringRuleRGBToYIQHexCode;
    
}

struct UserDataGramProtocol {
    int sourcePort = 541;
    int destinationPort = 53;
    public string sourceAddress = "192.168.1.10";
    public string destinationAddress = "192.168.1.1";
    public string description = "Domain Name System (DNS)";
    int length = 61;
    uint checksum = 0xf84;
    string checksumStatus = "unverified";
    uint streamIndex = 0;
    uint streamPacketNumber = 1;
    uint sequenceNumber = 1;
    uint acknowledgmentNumber = 0;
    bool isAcknowledgment = false;
    bool isPush = false;
    bool isReset = false;
    class TimeStamp {
        public uint secondsSinceEpoch = 0;
        public uint fraction = 0;
        public string timestamp = "0000-00-00 00:00:00.000000";
        public string relativeTime = "0 seconds";
        public string displayTime = "00:00:00.000";
        public string timeZone = "UTC";
        public bool isValid = false;
        public string toDisplay() {
            return displayTime;
        }
    }
   class UPDPayload {
     public string data = "";
   }
   public TimeStamp timestamp = new TimeStamp();
   public UPDPayload payload = new UPDPayload();
   public string toDisplay() {
       return `"Source Address: 
       {sourceAddress}\nDestination Address: {destinationAddress}\nDescription: 
       {description}\nLength: {length}\nChecksum: {checksum} ({checksumStatus})\n
       Stream Index: {streamIndex}\nStream Packet Number: {streamPacketNumber}\n
       Sequence Number: {sequenceNumber}\nAcknowledgment Number: {acknowledgmentNumber}\n
       Is Acknowledgment: {isAcknowledgment}\nIs Push: {isPush}\nIs Reset: {isReset}
       \nTimestamp: {timestamp.toDisplay()}\nPayload
       : payload.data}"`;
   }

}

struct DomainSystemQuery {
    public string queryName = "example.com";
    public string queryType = "A";
    public string queryClass = "IN";
    public string toDisplay() {
        return `"Query Name: {queryName}\nQuery Type: {queryType}\nQuery Class: 
        {queryClass}"`;
    }
    public string toHex() {
        return `"0000 0000 0000 0001 0000 0100 0000 000
        0000 0000 0000 0000 0000 0000 0000 0000
        {queryName.ToHex()} 0000 0001 {queryType.ToHex()} 
        0001 {queryClass.ToHex()}"`;
    }

    interface TrasitionId
    {
        
        int toInt();
        string toHex();
    }


   interface Flags
   {
    
        bool isResponse = false;
        bool isAuthoritative = false;
        bool isTruncated = false;
        bool isRecursionDesired = false;
        bool isRecursionAvailable = false;
        bool isZ = false;
        bool isAD = false;
        bool isCD = false;
        bool isReserved = false;
        bool isResponseCode = false;
        int responseCode = 0;
        int toInt();
        string toHex();
 

   }

   byte question = 1;
   byte answer = 2;
   byte authority = 5;
   byte additional = 10;
   int transactionId = 0x1234;
   public string toHex() {
    return `"{id.toHex()} {flags.toInt().ToString("X4")} 
    {question.ToString("X2")} 0001 0000 0000
    0000 0000 {queryName.ToHex()} 0000 0001 {queryType.ToHex()} 0001 {
    queryClass.ToHex()} 0000 0000 0000 0000"`;
   }

   interface Queries
   {
    
     string queryName;
         string queryType;
         string queryClass;
         string toHex() {
            return `"{queryName.ToHex()} 0000 {queryType.ToHex()} 
            0001 {queryClass.ToHex()}"`;
      
         }
         class Name
         {
            
             public string name;
             public string toHex() {
                return `"{name.ToHex()}"`;
             }
         }
         class NameLength {
             public int length;
             public string toHex() {
                return `"{length.ToString("X2")}"`;
             }
         }
         class LabelCount {
             public int count;
             public string toHex() {
                return `"{count.ToString("X2")}"`;
             }
         }
          class Type {
             public int type;
             public string toHex() {
                return `"{type.ToString("X2")}"`;
             }
         }
          class In : Type {
             public int inType;
             public string toHex() {
                return `"{in.ToString("X2")}"`;
             }
         }
    }

}

struct AditinalRecord {
    public string name = "example.com";
    public string type = "NS";
    public string inType = "IN";
    public string ttl = "86400";
    public string data = "ns1.example.com";
    public string toDisplay() {
        return `"Name: {name}\nType: {type}\nClass: {class}\nTTL: {ttl}\nData: {data}"`;
    
    }
    public string toHex() {
        return `"0000 0000 0000 0001 0000 0100 0000 00
        0000 0000 0000 0000 0000 0000 0000 0000
        {name.ToHex()} 0000 0001 {type.ToHex()} 0001 {class.ToHex()} {ttl.ToHex()}
        {data.ToHex()}"`;
    
    }
    class Root {
        public string name = "example.com";
        public string type = "SOA";
        public string inType = "IN";
        public string ttl = "86400";
        public string mname = "ns1.example.com";
        public string rname = "admin.example.com";
        public string serial = "2023031500";
    }

    class Name {
        public string name;
        public string toHex() {
            return `"{name.ToHex()}"`;
        }
    }

    class Type {
        public int type;
        public string toHex() {
            return `"{type.ToString("X2")}"`;
        }
    }

    class InType {
        public int inType;
        public string toHex() {
            return `"{inType.ToString("X2")}"`;
        }
    
    }

    class TTL {
        public int ttl;
        public string toHex() {
            return `"{ttl.ToString("X8")}"`;
        }
    }

    class Mname {
        public string name;
        public string toHex() {
            return `"{name.ToHex()}"`;
        }
    }

    class Rname {
        public string name;
        public string toHex() {
            return `"{name.ToHex()}"`;
        }
    
    }

    class Serial {
        public string serial;
        public string toHex() {
            return `"{serial.ToString("X8")}"`;
        }
    }
    class Refresh {
        public string refresh;
        public string toHex() {
            return `"{refresh.ToString("X8")}"`;
        }
    }

    class Retry {
        public string retry;
        public string toHex() {
            return `"{retry.ToString("X8")}"`;
        }
    }

    class Z {
        public string z;
        public string toHex() {
            return `"{z.ToString("X8")}"`;
        }
    }   

}








