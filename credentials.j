#! /bin/bash
{% import 'variables.private.include' as pvt %}
export STEAM_USERNAME="{{ pvt.steam_username }}"
export STEAM_PASSWORD="{{ pvt.steam_password }}"
export CSGO_KEY="{{ pvt.csgo_key }}"

