# README

### Verticals

#### Index:

```console
GET http://localhost:3000/verticals
```

#### Show:

```console
GET http://localhost:3000/verticals/10
```

#### Create:

```console
POST http://localhost:3000/verticals
{
  "vertical": {
    "name": "Music"
  }
}
```
#### Update:

```console
PATCH http://localhost:3000/verticals/10
{
  "vertical": {
    "name": "Business"
  }
}
```

#### Destroy:

```console
DELETE http://localhost:3000/verticals/10
```


### Categories

#### Index:

```console
GET http://0.0.0.0:3000/verticals/10/categories
```

#### Show:

```console
GET http://0.0.0.0:3000/verticals/10/categories/17
```

#### Create:

```console
POST http://0.0.0.0:3000/verticals/10/categories
{
  "category": {
    "name": "Classic Music",
    "state": "active"
  }
}
```
#### Update:

```console
PATCH http://localhost:3000/verticals/10/categories/17
{
  "category": {
    "name": "Pop Music"
  }
}
```

#### Destroy:

```console
DELETE http://localhost:3000/verticals/10/categories/17
```


### Courses

#### Index:

```console
GET http://0.0.0.0:3000/categories/17/courses
```

#### Show:

```console
GET http://0.0.0.0:3000/categories/17/courses/1
```

#### Create:

```console
POST http://0.0.0.0:3000/categories/17/courses
{
  "course": {
    "name": "Learn the Cello",
    "author": "Rostropovich",
    "state": "active"
  }
}
```
#### Update:

```console
PATCH http://0.0.0.0:3000/categories/17/courses/1
{
  "course": {
    "name": "Learn the Violin"
  }
}
```

#### Destroy:

```console
DELETE http://0.0.0.0:3000/categories/17/courses/1
```
