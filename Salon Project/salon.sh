#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to the Salon!\n"
  echo Select an option:  
SERVICE_LIST=$($PSQL "select * from services") 
echo "$SERVICE_LIST" | while read ID BAR NAME
do
  echo -e "\n$ID) $NAME" 
done  

read SERVICE_ID_SELECTED
SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
SERVICE_FORMATTED=$(echo $SERVICE | sed 's/^ //')
if [[ -z $SERVICE ]]
then
  MAIN_MENU "Please select a valid option."
  else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nLet's set you up with an account. What's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time do you want to make an appointment?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, time, service_id) VALUES('$CUSTOMER_ID','$SERVICE_TIME','$SERVICE_ID_SELECTED')")
  echo -e "\nI have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}
MAIN_MENU