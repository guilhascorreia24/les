from django.shortcuts import render, redirect
from django.contrib.auth import logout,authenticate,login
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.http import HttpResponse
from django.contrib import messages
from .models import Utilizador
def homepage(request):
    return render(request=request,template_name="home.html",context={"user":Utilizador.idutilizador})
    
def register(request):
    if request.method=="POST":
        form=UserCreationForm(request.POST)
        if form.is_valid():
            user=form.save()
            username=form.cleaned_data.get('username')
            login(request, user)
            return redirect("..")
        else:
            for msg in form.error_messages:
                print(form.error_messages[msg])
            return render(request=request,template_name="register.html",context={"form":form})
    form=UserCreationForm
    return render(request=request,template_name="register.html",context={"form":form})

# Create your views here.
