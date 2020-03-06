from django.contrib import admin
from .models import Utilizador

class Utilizadoradmin(admin.ModelAdmin):
    fields=["idutilizador","nome","email","telefone","password","username"]

admin.site.register(Utilizador,Utilizadoradmin)

# Register your models here.
