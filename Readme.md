# Virtual WordPress Lab

Το θέμα της εργασίας μας είναι η κατασκευή εικονικού εργαστηρίου για WordPress με docker containers. Περισσότερες λεπτομέρειες στο πως λειτουργεί θα βρείτε στην επίσημη ιστοσελίδα [WordPress image page](https://hub.docker.com/_/wordpress).


### **Προαπαιτούμενα site** 

Πριν ξεκινήσουμε πρέπει να έχουμε κατεβάσει το παρακάτω λογισμικό 

- Docker: [Installation Guide](https://docs.docker.com/get-docker/)
- Docker Compose: [Installation Guide](https://docs.docker.com/compose/install/)

### **Εγκατάσταση**

Πάμε στον κατάλογο του Project

```bash
cd new_wordpress
```
Ανοίγουμε το αρχείο 'docker-compose.yml' σε ένα text editor και κάνουμε αλλαγές(αν χρειάζεται)

``` yml
services:
  db:
    image: mysql:5.7 
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: MyR00tMySQLPa$$5w0rD
      MYSQL_DATABASE: MyWordPressDatabaseName
      MYSQL_USER: MyWordPressUser
      MYSQL_PASSWORD: Pa$$5w0rD  
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    restart: always
    ports:
      - "8080:80"
```

Στο παραπάνω κομμάτι κώδικα καθορίζουμε τις υπηρεσίες του WordPress χρησιμοποιώντας το image **'wordpress:latest'** και την πόρτα 8080. Για την βάση δεδομένων χρησιμοποιούμε το image **'mysql:5.7'** το οποίο συνδέεται με την ιστοσελίδα του WordPress.

Εκκίνηση του εικονικού εργαστηρίου με την παρακάτω εντολή 

```bash
docker-compose up -d
```
Έτσι θα κατέβουν τα docker images και θα ξεκινήσει το WordPress και η βάση δεδομένων σε containers στο παρασκήνιο.

Για την πρόσβαση στο εικονικό εργαστήριο:
Ανοίγουμε έναν web browser και πληκτρολογούμε την διεύθυνση 'http://localhost:8080' για πρόσβαση στην εγκατάσταση του WordPress.

Χρησιμοποιήστε την εγκατάσταση του WordPress για να προσαρμόσετε τον ιστότοπό σας,να δοκιμάσετε προσθήκες,θέματα ή ό,τι άλλο επιθυμείτε. Ό,τι αλλαγές γίνουν στο περιβάλλον του εργαστηρίου θα φαίνονται στον κατάλογο './wp-content' του πρότζεκτ σας.

### **ΜΗΝ ΞΕΧΑΣΕΤΕ**

Για να τερματίσετε την διαδικασία του εικονικού εργαστηρίου χρησιμοποιήστε την παρακάτω εντολή

```bash
docker-compose down
```
