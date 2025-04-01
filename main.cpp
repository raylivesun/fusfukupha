#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LENGTH 50
#define MAX_EMAIL_LENGTH 100
#define MAX_PHONE_NUMBER_LENGTH 20
#define MAX_ADDRESS_LENGTH 100

struct Contact {
    char name[MAX_NAME_LENGTH];
    char email[MAX_EMAIL_LENGTH];
    char phone_number[MAX_PHONE_NUMBER_LENGTH];
    char address[MAX_ADDRESS_LENGTH];
};

void add_contact(struct Contact contacts[], int *num_contacts) {
    printf("Enter contact name: ");
    scanf("%[^\n]", contacts[*num_contacts].name);
    getchar();  // Consume newline character
    printf("Enter contact email: ");
    scanf("%[^\n]", contacts[*num_contacts].email);
    getchar();  // Consume newline character
    printf("Enter contact phone number: ");
    scanf("%[^\n]", contacts[*num_contacts].phone_number);
    getchar();  // Consume newline character
    printf("Enter contact address: ");
    scanf("%[^\n]", contacts[*num_contacts].address);
    getchar();  // Consume newline character
    (*num_contacts)++;
    printf("Contact added successfully.\n");
    printf("\n");
    return;
}

void edit_contact(struct Contact contacts[], int num_contacts) {
    char name[MAX_NAME_LENGTH];
    int index;
    printf("Enter contact name to edit: ");
    scanf("%[^\n]", name);
    getchar();  // Consume newline character
    for (index = 0; index < num_contacts; index++) {
        if (strcmp(contacts[index].name, name) == 0) {
            printf("Enter updated contact details:\n");
            printf("Enter contact email: ");
            scanf("%[^\n]", contacts[index].email);
            getchar();  // Consume newline character
            printf("Enter contact phone number: ");
            scanf("%[^\n]", contacts[index].phone_number);
            getchar();  // Consume newline character
            printf("Enter contact address: ");
            scanf("%[^\n]", contacts[index].address);
            getchar();  // Consume newline character
            printf("Contact updated successfully.\n");
            printf("\n");
            return;
        }
    }
    printf("Contact not found.\n");
    printf("\n");
    return;
}

void delete_contact(struct Contact contacts[], int *num_contacts) {
    char name[MAX_NAME_LENGTH];
    int index;
    printf("Enter contact name to delete: ");
    scanf("%[^\n]", name);
    getchar();  // Consume newline character
    for (index = 0; index < *num_contacts; index++) {
        if (strcmp(contacts[index].name, name) == 0) {
            for (int i = index; i < *num_contacts - 1; i++) {
                contacts[i] = contacts[i + 1];
            }
            (*num_contacts)--;
            printf("Contact deleted successfully.\n");
            printf("\n");
            return;
        }
    }
    printf("Contact not found.\n");
    printf("\n");
    return;
}

void search_contact(struct Contact contacts[], int num_contacts) {
    char name[MAX_NAME_LENGTH];
    int found = 0;
    printf("Enter contact name to search: ");
    scanf("%[^\n]", name);
    getchar();  // Consume newline character
    for (int i = 0; i < num_contacts; i++) {
        if (strcmp(contacts[i].name, name) == 0) {
            printf("Contact found:\n");
            printf("Name: %s\n", contacts[i].name);
            printf("Email: %s\n", contacts[i].email);
            printf("Phone number: %s\n", contacts[i].phone_number);
            printf("Address: %s\n", contacts[i].address);
            printf("\n");
            found = 1;
            break;
        }
    }
    if (!found) {
        printf("Contact not found.\n");
        printf("\n");
    }
    return;
}

void display_contacts(struct Contact contacts[], int num_contacts) {
    printf("Contacts:\n");
    for (int i = 0; i < num_contacts; i++) {
        printf("%d. Name: %s\n", i + 1, contacts[i].name);
    }
    printf("\n");
    return;
}

int main() {
    struct Contact contacts[100];
    int num_contacts = 0;
    int choice;
    while (1) {
        printf("Contact Management System\n");
        printf("1. Add contact\n");
        printf("2. Edit contact\n");
        printf("3. Delete contact\n");
        printf("4. Search contact\n");
        printf("5. Display contacts\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar();  // Consume newline character
        switch (choice) {
            case 1:
                add_contact(contacts, &num_contacts);
                break;
            case 2:
                edit_contact(contacts, num_contacts);
                break;
            case 3:
                delete_contact(contacts, &num_contacts);
                break;
            case 4:
                search_contact(contacts, num_contacts);
                break;
            case 5:
                display_contacts(contacts, num_contacts);
                break;
            case 6:
                printf("Exiting...\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
                printf("\n");
        }
        printf("Press any key to continue...");
        getchar();  // Consume newline character
        system("clear");  // Clear the screen
        printf("\n");
        fflush(stdout);  // Ensure output is displayed immediately
        fflush(stdin);  // Clear input buffer
        fflush(stderr);  // Clear error buffer
    }
    return 0;
}
