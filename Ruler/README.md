Ruler
=====
ASP.NET Web API services built to give users <strong>"if conditions"</strong> in their lives. Server evaluates rules on condition basis and return action, which can be invoked in various clients. Typical usage - a person can put himself a reminder for an event if some conditions are true. 
<br />
<br />
<strong>Conditions</strong> can be any comparison between two comparable values and are evaluated abstractly no matter how they are saved.
<br />
<br />
Example conditions can be: current day of week is Sunday, the weather outside is sunny, current location is Sofia, Bulgaria, etc.
<br />
<br />
If the conditions in a rule are true, the server sends <strong>push notification</strong> with corresponding <strong>action</strong> to all the clients, the user is currently logged in.
<br />
<br />
Example actions can be: send SMS message to a list of recipients, containing predefined text, publish on social network status update, call a friend, etc.

<br />
The <strong>Ruler Server</strong> solution contains the following projects:
<ul>
<li>
<strong>Model</strong> - data layer for users, conditions, actions and rules
</li>
<li>
<strong>Data</strong> - repositories for all database tables
</li>
<li>
<strong>Executor</strong> - executes a custom condition and returns result based on three string properties: 
<ul>
<li>
<strong>Property</strong> (the property of the class to compare, example: "Age")
</li>
<li>
<strong>Operator</strong> (binary .NET operator or custom method, example: "GreaterThan")
</li>
<li>
<strong>Value</strong> (target value to compare, example: "10")
</li>
</ul>
</li>
<li>
<strong>Services</strong> - contains available <strong>REST</strong> services to consume (detailed information in <strong>Documentation</strong> folder)
</li>
</ul>

<br />
Currently the latest version of the Rules server is hosted at <a href="http://ruler.apphb.com/">http://ruler.apphb.com/</a>