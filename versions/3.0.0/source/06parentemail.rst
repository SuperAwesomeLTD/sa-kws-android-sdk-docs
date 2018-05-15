Associate a parent email
========================

.. note::
  This is the same behaviour as the **Update user** page. Only highlighted due to the importance of this functionality relating to the permissions.

You can associate a parent email for the user you're authenticated using the **IUserService** and call:

* **updateUser**

This function will take: 

======== ================ ========
Value    Type             Meaning
======== ================ ========
details  Map<String, Any> A map of the fields to update
userId   String           The current authenticated user id
token    String           The current authenticated user token
======== ================ ========

  .. code-block:: java

   //myEnvironment is considered to be a valid environment 

   val sdk = ComplianceSDK(myEnvironment)
   val userService = sdk.getService(IUserService::class.java)

   val details: Map<String, Any> = mapOf(
                "parentEmail" to "parent@test.com")

   userService?.updateUser(details = details, userId = 123, token = "AAA.BBB.CCC") { error ->

      if(error == null){
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

The callback will pass the following value on completion:

======= ========= ======
Value   Type      Meaning
======= ========= ======
error   Throwable If non-null, an error occurred
======= ========= ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

