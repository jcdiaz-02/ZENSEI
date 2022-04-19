
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;

//This file is used for the encryption of the passwords
public class Security {
        // method to encrypt password
	public static String encrypt(String strToEncrypt,byte[]publicKey) {
		String encryptedString = null;
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");//type of cipher used
			final SecretKeySpec secretKey = new SecretKeySpec(publicKey, "AES");//key and type of cipher to be used
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));//encrypts password
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return encryptedString;
	}

        //Method used to decrypt the password FROM the database
	public static String decrypt(String codeDecrypt,byte[]publicKey) {
		String decryptedString = null;
		try{
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");//type of cipher used *note: cipher used for decrypt must be the same for encrypt
			final SecretKeySpec secretKey = new SecretKeySpec(publicKey, "AES");//key and type of cipher to be used
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));//decrypts the password to match user input versus database string
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return decryptedString;
	}	
}
