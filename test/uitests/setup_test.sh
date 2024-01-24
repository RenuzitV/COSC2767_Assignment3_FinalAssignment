#!/bin/bash

# Setup installation of Selenium dependencies via pipenv
sudo yum -y install python-pip
pip install pipenv
pipenv install pytest
pipenv install selenium
pipenv install webdriver_manager
pipenv run python -m pytest > output.log