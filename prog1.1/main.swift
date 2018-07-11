//
//  main.swift
//  prog1.1
//
//  Created by Angus Reid on 7/11/18.
//  Copyright © 2018 Angus Reid. All rights reserved.
//

import Foundation

/*
 *checks a word for emoji match and returns
 *corresponding unicode. if no emoji match found,
 *the word string is returned unchanged
 * @param: word - string to match with emoji
 * @return: String - utf code for matched emojior the original string
 */
 

func emojicode(word: String) -> String {
    
    //convert the characters in the string
    //to lowercase and check for emoji match
    switch word.lowercased(){
    
    case "beer":
        return "\u{1F37A}"
    
    case "television", "tv":
        return "\u{1F4FA}"
        
        // switch statements must cover all the cases,
        // the default case is taken when no other
        // cases match
        
    default:
        return word
        }
    
}

/*
 * Prints a string replacing matched word with corresponding emoji
 * @param: str - display
 * @return: String - argument string with some words replaced with utf code for
 * corresponding emojis
 */

func emojiate(str: String) -> String {
    // Break the string into seperate word tokens. start with empty token
    var word: String = ""
    var result: String = ""
    
    //iterate over every character in the string
    
    for char: Character in str {
        //check the character
        if(String(char) >= "A" && String(char) <= "z"){
            // If the next character is a letter, add it
            // to the word token
            word.append(char)
            
        } else {
            // If the next character is not a letter,
            // try to convert the last word token
            // to emoji and add it to result string
            // (in swift addition operator concatenates
            // string)
            
            result += emojicode(word: word)
            
            // Add the current non-letter character to
            // the result (swift doesn't allow addition
            // of Character to String, so use append
            // method of String to concatenate a Character)
            
            result.append(char)
            
            //Clear the word token
            
            word = ""
            
        }
        
    }
    
    //Add the last word toekn to the result string
    // (matching it with emoji if possible)
    
    result += emojicode(word: word)
    
    // Return the resulting string
    return result
    
}

// define a string constnt
     
let myString = "No TV and no beer make Homer something something."

//convert it to emoji string

let emojiString = emojiate(str: myString);

print(emojiString)

