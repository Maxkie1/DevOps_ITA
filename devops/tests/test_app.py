from app import app
import pytest
from flask import Flask, render_template
import unittest

@pytest.fixture

def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_index(client):
    # Test the index page
    response = client.get('/')
    assert response.status_code == 200

def test_hello(client):
    # Test the hello route with no name or blank name
    response = client.get('/hello')
    assert response.status_code == 405


def test_name(client):
    response = client.post(
      '/hello',
      data = dict(name="TestName")
      )
    assert b'TestName' in response.data