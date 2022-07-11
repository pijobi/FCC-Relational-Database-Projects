#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
SCORE=0
CHECK_NUM='^[0-9]+$'

echo -e "\n~~ Number Guessing Game ~~\n"
echo Enter your username:
read USERNAME


#if not used before
CHECK_USERNAME=$($PSQL "SELECT * FROM games WHERE username='$USERNAME'")
if [[ -z $CHECK_USERNAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
#if used before
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(score) FROM games WHERE username='$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

while [[ $GUESS != $SECRET_NUMBER ]]
do
  read GUESS 
  if [[ ! $GUESS =~ $CHECK_NUM ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS > $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS < $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
  SCORE=$((SCORE+1))
done


#When the secret number is guessed, your script should print 
echo "You guessed it in $SCORE tries. The secret number was $SECRET_NUMBER. Nice job!"
SAVE_SCORE=$($PSQL "INSERT INTO games(username,score) VALUES('$USERNAME',$SCORE)")