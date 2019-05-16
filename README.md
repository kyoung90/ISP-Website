# ISP-Website

A website that allows you to purchase an internet package plan and keep track of your payment history, service periods, and internet status changes. It connects to a router through the mtik gem and makes changes to pppoe profiles. This is meant to be a skeleton project to communicate with different routers and store information on the website. No payment API has been implemented yet.

## Getting Started 

Clone the files into your pc. Create an .env file in your root directory with your router's ip address, username, and password, as well as your facebook developer's key and secrets.

```
FACEBOOK_KEY=<key>
FACEBOOK_SECRET=<secret>

ROUTER_HOST="<ip address>"
ROUTER_USERNAME="<username>"
ROUTER_PASSWORD="<password>"
```

## Communicating With Router

All of the communication with the router is happening inside the file app > models > user.rb

Play around with the tikcli gem and test out router commands before writing them down in the user model.

The documentation for the communication I used for the tikcli is [here](https://wiki.mikrotik.com/wiki/API_Ruby_class).
  
## Features

* Login/Signup users
* Login users with facebook
* View all internet plans and 'purchase'
* Send router commands 
* View payment histories
* View all service periods
* View all internet status changes

## Contributing

Please feel free to contribute :)

## Authors

* **kyoung** - *Initial work* - [kyoung90](https://github.com/kyoung90) 
* **epeña** - *Hardware and all network setup*  

See also the list of [contributors](https://github.com/kyoung90/country/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

