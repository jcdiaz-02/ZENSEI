/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exceptions;

/**
 *
 * @author HP
 */
public class AuthenticationExceptionUsername extends RuntimeException {
    
   public AuthenticationExceptionUsername()
    {
        super("Incorrect Username/password!");    
    }
    
}
