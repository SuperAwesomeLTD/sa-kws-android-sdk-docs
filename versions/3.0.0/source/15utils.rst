KWS Utils
=========

The Kids Web Service SDK has an utility class to help you out with some operations.

Parsing JWT Tokens
^^^^^^^^^^^^^^^^^^

As highilighted before, the SDK works with `JWT Tokens <https://jwt.io/introduction/>`_ when dealing with sessions.

A simple way of retrieving information from the **authenticated** token is by using the out-of-the-box **UtilsHelper** class.

.. code-block:: java

   //we'll assume 'token' is valid
   val token = "AAA.BBB.CCC"

   //parse the token
   val tokenData = UtilsHelper.getMetadataFromToken(token)

   tokenData?.let {
    //Cool! We have a valid token data object. We can start using its data.
   } ?: run {
    //Uh-oh! It seems there's an error...
   }

This is a **sync** operation that returns:

========= =========
Type      Meaning
========= =========
TokenData If non-null, a valid object
========= =========

The **TokenData** object, as seen before, contains the following fields:

============== ========= ========
Field          Type      Meaning
============== ========= ========
userId         Integer   The user id for the parsed token
appId          Integer   The app id for the parsed token
clientId       String    The client id for the parsed token
scope          String    The scope for the parsed token
iss            String    The issue entity for the parsed token
iat            Long      The issued time as timestamp
exp            Long      The expiry time as timestamp
============== ========= ========

.. note::
 This is only a suggestion on how to parse the authenticated token.