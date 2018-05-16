Get leaderboard
===============

You can get the current application leaderboard by calling:

.. code-block:: java

  KWS.sdk.getLeaderBoard (MainActivity, new KWSGetLeaderboardInterface() {
    @Override
    public void gotLeaderboard (List<KWSLeader> leaderboard) {
      // show leaderboard
	  }
  });

The callback will pass the following value on completion:

======= ================== ======
Value   Type               Meaning
======= ================== ======
leaders Array of KWSLeader An array of KWSLeader objects
======= ================== ======

The **KWSLeader** object contains the following fields:

===== ======= =======
Field Type    Meaning
===== ======= =======
user  String  The username
rank  Integer Users' current rank in the app
score Integer Users' current score in the app
===== ======= =======
