Invite friends
==============

You can invite other users on behalf of the user you're authenticated as by using **IUserActionsService** and calling:

* **inviteUser**

.. code-block:: java

   //myEnvironment is considered to be a valid environment 

   val sdk = ComplianceSDK(myEnvironment)
   val userActionsService = sdk.getService(IUserActionsService::class.java)

   userActionsService?.inviteUser(email = "friend@test.com", userId = 123, token = "AAA.BBB.CCC") { error ->

      if(error == null){
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

The callback will pass the following values on completion:

======= ========= ======
Value   Type      Meaning
======= ========= ======
error   Throwable If non-null, an error occurred
======= ========= ======
