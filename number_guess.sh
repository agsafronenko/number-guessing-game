#!/bin/bash

# ~~~~ number guessing game program ~~~~

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -c"

START_THE_GAME() {
  RANDOM_NUMBER=$[ ( $RANDOM % 1000 )  + 1 ]

  echo "Enter your username:"
  read USERNAME

  USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM games_history WHERE username='$USERNAME'")
  NUMBER_OF_GUESSES=0
  GAMES=0
  BEST=1000

   if [[ -z $USER_DATA ]]
    then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
      while read USER BAR GAMES_PLAYED BAR BEST_GAME
        do
          echo "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
          GAMES=$GAMES_PLAYED
          BEST=$BEST_GAME
        done <<< $(echo "$USER_DATA")
  fi

  echo "Guess the secret number between 1 and 1000:"

  GUESS_FUNC
}

GUESS_FUNC() {
    read USER_GUESS
    if [[ $USER_GUESS =~ ^[0-9]+$ ]]
      then
        ((NUMBER_OF_GUESSES++))

        if (( $USER_GUESS == $RANDOM_NUMBER ))
          then
            echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
            ((GAMES++))
            if (( $BEST > $NUMBER_OF_GUESSES ))
            then
            BEST=$NUMBER_OF_GUESSES
            fi
            if [[ -z $USER_DATA ]]
              then
              UPDATE_NEW_USER=$($PSQL "INSERT INTO games_history(username) VALUES('$USERNAME')")
            fi
              UPDATE_GAMES_PLAYED=$($PSQL "UPDATE games_history SET games_played=$GAMES WHERE username='$USERNAME'")
              UPDATE_BEST_GAME=$($PSQL "UPDATE games_history SET best_game=$BEST WHERE username='$USERNAME'")
        fi
        if (( $USER_GUESS > $RANDOM_NUMBER ))
          then
            echo "It's lower than that, guess again:"
            GUESS_FUNC
        fi
        if (( $USER_GUESS < $RANDOM_NUMBER ))
          then
            echo "It's higher than that, guess again:"
            GUESS_FUNC
        fi
    else 
      echo "That is not an integer, guess again:"
      GUESS_FUNC
    fi
  }

START_THE_GAME

