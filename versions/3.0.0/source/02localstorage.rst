Local storage
==============

The Kid Web Service SDK allows you to quickly and swiftly manage your session.

This is done using the **ISessionService** and its methods.


Store a user
^^^^^^^^^^^^

To store a certain user in your local storage, just call:

	* **saveLoggedUser**

This function will take: 

============== ================== ==========
Value           Type              	Meaning
============== ================== ==========
context         Context  			The current context of the application
user            ILoggedUserModel  	The current valid ILoggedUserModel (from login/create)
============== ================== ==========

And should look like:

.. code-block:: java

	//myEnvironment is considered to be a valid environment 

	val sdk = ComplianceSDK(myEnvironment)
	val authService = sdk.getService(type = ISessionService::class.java)

	val success = authService?.saveLoggedUser(context = this, user = user)
	
This is a **sync** operation that returns:

* true
* false

Is there a user stored locally
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To check if there's a valid cached user, just call:

	* **isUserLoggedIn**

This function will take:

============== ======== ========
Field          Type     Meaning
============== ======== ========
context	       Context  The current context of the application
============== ======== ========

And should look like:

.. code-block:: java

	//myEnvironment is considered to be a valid environment 

	val sdk = ComplianceSDK(myEnvironment)
	val authService = sdk.getService(type = ISessionService::class.java)

	val isUserLoggedIn = authService?.isUserLoggedIn(this)

This is a **sync** operation that returns:

* true
* false

Get current stored user
^^^^^^^^^^^^^^^^^^^^^^^

To store a certain user in your local storage, just call:

	* **getCurrentUser**

This function will take:

============== ======== ========
Field          Type     Meaning
============== ======== ========
context	       Context  The current context of the application
============== ======== ========

And should look like:

.. code-block:: java

	//myEnvironment is considered to be a valid environment 

	val sdk = ComplianceSDK(myEnvironment)
	val authService = sdk.getService(type = ISessionService::class.java)

	val currentStoredUser = authService?.getCurrentUser(this)

	return currentStoredUser

This is a **sync** operation that returns:

============== ================== =========
Value           Type               Meaning
============== ================== =========
user            ILoggedUserModel   If non-null, the currently locally cached user
============== ================== =========


Logout current stored user
^^^^^^^^^^^^^^^^^^^^^^^^^^

To logout a certain user from your local storage, just call:
  
  * **clearLoggedUser**

This function will take:

============== ======== ========
Field          Type     Meaning
============== ======== ========
context	       Context  The current context of the application
============== ======== ========

And should look like:

.. code-block:: java

	//myEnvironment is considered to be a valid environment 

	val sdk = ComplianceSDK(myEnvironment)
	val authService = sdk.getService(type = ISessionService::class.java)

	val success = authService?.clearLoggedUser(this)

This is a **sync** operation that returns:

* true
* false

.. note::
	After a user is logged out you won't be able to perform any of the SDK actions, like obtaining details, checking score, etc.
