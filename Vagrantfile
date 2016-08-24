# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "railsbridge"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    echo "Installing scala and setting it up . . . "
     
    apt-get update > /dev/null 2>&1
    apt-get install -y scala > /dev/null 2>&1
     
    echo "Installing SBT . . ."
    debfile="repo-deb-build-0002.deb"
    wget http://apt.typesafe.com/"$debfile" > /dev/null 2>&1
    dpkg -i "$debfile" > /dev/null 2>&1
    apt-get update > /dev/null 2>&1
    apt-get install -y sbt > /dev/null 2>&1

    echo "Installing Elixir"
    debfile="debfile="repo-deb-build-0002.deb""
    wget https://packages.erlang-solutions.com/"$debfile" > /dev/null 2>&1
    dpkg -i "$debfile" > /dev/null 2>&1
    apt-get install -y esl-erlang > /dev/null 2>&1
    apt-get install -y elixir > /dev/null 2>&1
     
    basevim="/home/vagrant/.vim"
     
    echo "Setting up VIM for syntax highlighting"
     
    mkdir -p "$basevim"/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do wget --no-check-certificate -O "$basevim"/$d/scala.vim https://raw.github.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim; done > /dev/null 2>&1
     
    rm -f "$debfile"

    ELIXIR_VERSION=1.3.2
    NODE_VERSION=6

    # Note: password is for postgres user "postgres"
    POSTGRES_DB_PASS=postgres
    POSTGRES_VERSION=9.3

    # Set language and locale
    apt-get install -y language-pack-en
    locale-gen --purge en_US.UTF-8
    echo "LC_ALL='en_US.UTF-8'" >> /etc/environment
    dpkg-reconfigure locales

    # Install basic packages
    # inotify is installed because it's a Phoenix dependency
    apt-get -qq update
    apt-get install -y \
    wget \
    git \
    unzip \
    build-essential \
    ntp \
    inotify-tools

    # Install Erlang
    echo "deb http://packages.erlang-solutions.com/ubuntu xenial contrib" >> /etc/apt/sources.list && \
    apt-key adv --fetch-keys http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc && \
    apt-get -qq update && \
    apt-get install -y \
    esl-erlang

    # Install Elixir
    cd / && mkdir elixir && cd elixir && \
    wget -q https://github.com/elixir-lang/elixir/releases/download/v$ELIXIR_VERSION/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm -f Precompiled.zip && \
    ln -s /elixir/bin/elixirc /usr/local/bin/elixirc && \
    ln -s /elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /elixir/bin/mix /usr/local/bin/mix && \
    ln -s /elixir/bin/iex /usr/local/bin/iex

    # Install local Elixir hex and rebar for the vagrant user
    su - vagrant -c '/usr/local/bin/mix local.hex --force && /usr/local/bin/mix local.rebar --force'

    # Postgres
    apt-get -y install postgresql-$POSTGRES_VERSION postgresql-contrib-$POSTGRES_VERSION

    PG_CONF="/etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf"
    echo "client_encoding = utf8" >> "$PG_CONF" # Set client encoding to UTF8
    service postgresql restart

    cat << EOF | su - postgres -c psql
    ALTER USER postgres WITH ENCRYPTED PASSWORD '$POSTGRES_DB_PASS';
    EOF

    # Install nodejs and npm
    curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
    apt-get install -y \
    nodejs

    # Install imagemagick
    apt-get install -y imagemagick

    # If seeds.exs exists we assume it is a Phoenix project
    if [ -f /vagrant/priv/repo/seeds.exs ]
      then
        # Set up and migrate database
        su - vagrant -c 'cd /vagrant && mix deps.get && mix ecto.create && mix ecto.migrate'
        # Run Phoenix seed data script
        su - vagrant -c 'cd /vagrant && mix run priv/repo/seeds.exs'
    fi
  SHELL
end
