##duplicate_lines_filter

**How**

```
duplicate_lines_filter.py [-h] [--path PATH] [--name NAME]
```

**arguments:**

  - -h, --help   show this help message and exit
  - --path PATH  of file to filter.
  - --name NAME  to store new file.


##find_contact_db

**how**

```
./find_contact_db
```

**arguments:**

```
no arguments to use
```

##search_sqlite_db

**How**

```
search_sqlite_db [-c]<-t><-m> <-n sqlite_db_name>
```
**arguments:**

- -c          default argument, find & open contacts.db
- -t          find & open todo.db
- -m          find & open imail.db
- -n path     find the specified db with path, and open it