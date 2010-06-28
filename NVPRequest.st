Iliad.ILObject subclass: NVPRequest [
    | transaction |

    <category: 'PayPal'>
    <comment: 'I am the implementation of an abstract NVP Request for the NVP API'>

    method [
	<category: 'accessing'>
	self subclassResponsibility
    ]

    transaction [
	<category: 'accessing'>
	^transaction
    ]

    transaction: aTransaction [
	<category: 'accessing'>
	transaction := aTransaction
    ]

    account [
	<category: 'accessing'>
	^self transaction account
    ]

    requestUrl [
	<category: 'accessing'>
	| url |
	url := Iliad.ILUrl absolute: self transaction baseUrl.
	url
	    addParameter: 'user' value: self account user;
	    addParameter: 'pwd' value: self account password;
	    addParameter: 'signature' value: self account signature;
	    addParameter: 'version' value: self transaction version;
	    addParameter: 'paymentaction' value: self transaction paymentAction;
	    addParameter: 'amt' value: self transaction amount;
	    addParameter: 'currencycode' value: self transaction currency;
	    addParameter: 'method' value: self method.
	^url
    ]
]