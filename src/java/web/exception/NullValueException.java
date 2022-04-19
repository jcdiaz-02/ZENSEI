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

// exception for nullvalue errors that will be used for noLoginCredentials.jsp
public class NullValueException extends RuntimeException{
    public NullValueException()
    {
       super("no username and password values");
    }
}
