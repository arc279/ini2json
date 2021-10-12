# ini to json

using [jq](https://stedolan.github.io/jq/)

## sample

```
$ jq --version
jq-1.6

$ cat sample/my.ini | ./ini2json.jq
[
  {
    "[mariadb]": {
      "Description": "The Database for mariadb",
      "Trace": "On",
      "TraceFile": "stderr",
      "Driver": "mariadb",
      "SERVER": "192.168.12.1",
      "USER": "root",
      "PASSWORD": "1234",
      "PORT": "3306",
      "DATABASE": "test",
      "charset": "UTF8"
    }
  },
  {
    "[mysql]": {
      "Description": "The Database for mysql",
      "Trace": "On",
      "TraceFile": "stderr",
      "Driver": "mysql",
      "SERVER": "192.168.12.124",
      "USER": "root",
      "PASSWORD": "1234",
      "PORT": "3306",
      "DATABASE": "test"
    }
  }
]
```
