from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login


def home(request):
    return render(request=request,template_name="homepage.html",context={})

def register(request):
    return render(request=request,template_name="registerpage.html",context={"form":UserCreationForm})
