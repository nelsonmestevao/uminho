#!/usr/bin/env bash

ansible -i hosts.inv -u nelsonmestevao all -m ping

