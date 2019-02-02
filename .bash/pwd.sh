#!/bin/bash

pwdsave() {
  pwd > /tmp/last_path;
}

pwdget() {
  cd $(cat /tmp/last_path);
}