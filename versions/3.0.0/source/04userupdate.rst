Update a user
=============

You can update information for the user you're authenticated by using the **IUserService** and call:

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
                "firstName" to "John",
                "lastName" to "Doe")

   userService?.updateUser(details = details, userId = 123, token = "AAA.BBB.CCC") { error ->

      if(error == null){
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

A more complex example of an update is where you'd want to update something like the **address**. 

This is how you should do it:

.. code-block:: java

   //myEnvironment is considered to be a valid environment 

   val sdk = ComplianceSDK(myEnvironment)
   val userService = sdk.getService(IUserService::class.java)


   //build your address model
   val myAddressModel = mapOf(
                "street" to "22 Long Acre",
                "city" to "London",
                "postCode" to "WC2E 9LY",
                "country" to "GB"
        )

   //make it a JSON Object
   val addressModelAsJSONObject = JSONObject(myAddressModel)

   //add it to the details
   val details: Map<String, Any> = mapOf(
                "firstName" to "Droid",
                "lastName" to "Test",
                "address" to addressModelAsJSONObject)

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

	Please note that if you're trying to update a piece of information you haven't been granted permission for
	the whole update operation will fail.
