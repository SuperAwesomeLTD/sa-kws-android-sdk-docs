Get score
=========

You can get the current score of the user you're authenticated as by by using **IScoringService** and calling:

* **getScore**

And it will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
appId       Integer The app id
token       String  The authenticated user token
=========== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

.. code-block:: java

   //myEnvironment is considered to be a valid environment 

   val sdk = ComplianceSDK(myEnvironment)
   val scoringService = sdk.getService(IScoringService::class.java)

   scoringService?.getScore(appId = 2, token = "AAA.BBB.CCC") { scoreModel, error ->

      if(scoreModel != null){
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

The callback will pass the following value on completion:

=========== ===================== ======
Value   		Type    		  Meaning
=========== ===================== ======
userDetails 	IScoreModel       If non-null, the SDK was able to a score for the user
error           Throwable         If non-null, an error occurred
=========== ===================== ======

The **IScoreModel** object contains the following fields:

===== ======= =======
Field Type    Meaning
===== ======= =======
rank  Integer Users' current rank in the app
score Integer Users' current score in the app
===== ======= =======
