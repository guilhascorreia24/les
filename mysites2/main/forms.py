from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class NewUserForm(UserCreationForm):
    email=forms.EmailField(required=True)

    class Meta:
        model=User
        fields=('username','email','password','password1')

    def save(self,commint=True):
        user=super(NewUserForm,self).save(commint=False)
        user.email=self.cleaned_data["email"]
        if commint:
            user.save()
        return user