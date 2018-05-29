Get leaderboard
===============

You can get the current application's leaderboard, for the user you're authenticated as, by using **IScoringService** and calling:

* **getScore**

It will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
appId       Integer The app id
token       String  The authenticated user token
=========== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

And an example is:

.. code-block:: java

   val myEnvironment = MyEnvironment()
   val sdk = ComplianceSDK(myEnvironment)
   val scoringService = sdk.getService(IScoringService::class.java)

   scoringService?.getLeaderboard(appId = 2, token = "AAA.BBB.CCC") { leadersWrapperModel, error ->

      if(leadersWrapperModel != null){
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

The callback will pass the following value on completion:

==================== ===================== ======
Value   		     Type    		       Meaning
==================== ===================== ======
leadersWrapperModel  ILeadersWrapperModel  If non-null, the SDK was able to retrieve information about the leaderboard
error                Throwable             If non-null, an error occurred
==================== ===================== ======

The **ILeadersWrapperModel** contains the following fields:

======= ======================= =======
Field   Type                    Meaning
======= ======================= =======
results ArrayList<ILeaderModel> A list of leaderboards
count   Integer                 The number of items in the leaderboard
offset  Integer                 The offset of the leaderboard
limit   Integer                 The limit for the leaderboard
======= ======================= =======

The **ILeaderModel** contains the following fields:

======= ======== =======
Field   Type     Meaning
======= ======== =======
name    String   The username in leaderboard
score   Integer  Current score in the app
rank    Integer  Current rank in the app
======= ======== =======