#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    INFO=$($PSQL "SELECT * FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE '$1' IN(atomic_number)")
  else
    INFO=$($PSQL "SELECT * FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE '$1' IN(symbol, name)")
  fi
  if [[ -z $INFO ]]
  then
    echo I could not find that element in the database.
  else
    echo "$INFO" | while IFS="|" read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." 
    done
  fi
else
  echo Please provide an element as an argument.
fi