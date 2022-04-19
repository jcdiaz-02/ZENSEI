/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.exception;

/**
 *
 * @author Admin
 */

// exception for authentication errors that will be used for error_authentication.jsp
public class AuthenticationException extends RuntimeException
{
    public AuthenticationException()
    {
       super("wrong username/ password");
      
    }
}
