# vagrant-chef
A simple example of Vagrant and Chef environment

Run to install dependencies
```ruby
startup.sh 
```

Run to execute cookbook dependency manager 
```ruby
librarian-chef init
```

Create your Cheffile and append your cookbooks then
```ruby
librarian-chef install
```

View the Chef Community cookbooks resources or [create it] (https://learn.chef.io/legacy/tutorials/create-your-first-cookbook/)



Create the nodes list in /config/nodes.json
```ruby
"nodes": {
		"web01": {
			":node": "WebServer-01",
			":ip": "192.168.33.21",
			":host": "web01",
			"ports": [
				{
					":host": 2201,
					":guest": 22,
					":id": "ssh"
				},
				{
					":host": 8000,
					":guest": 8000,
					":id": "wls-listen"
				}
			],
			":memory": 2048
		}
}
```

Config your nodes
```ruby
{
    "run_list": [
        "recipe[chef-client::default]",
        "recipe[mysql::server]"
    ]
}
```


Up your boxes
```ruby
vagrant up
```

Librarian-Chef plugin
https://github.com/applicationsonline/librarian-chef

Vagrant
https://www.vagrantup.com/

Chef Community resources
https://supermarket.chef.io/
