from tkinter import *
from tkinter.scrolledtext import ScrolledText
from tkinter import font


#filtroAzul = [ False, False]

filtroAzul  = {"Rojo": False ,"Verde": False }
filtroRojo  = {"Azul": False ,"Verde": False }
filtroVerde = {"Azul": False ,"Rojo" : False }
indice = 1000.0

#------------------------------------Funciones-------------------------------


   #-------------------------------control de mensajes-----------------------
def enviar(proxy):
	if proxy == 1:

		chat. insert(indice, ' Azul:'+'\n' + pantalla.get() + '\n')

		if filtroVerde["Azul"] == False:
			chat3.insert(indice, ' Azul:'+'\n' + pantalla.get() + '\n')
		if filtroRojo["Azul"] == False: 
			chat2.insert(indice, ' Azul:'+'\n' + pantalla.get() + '\n')
	n.set("")		

	if proxy == 2:
		chat2.insert(indice, ' Rojo:'+'\n' + pantalla2.get() + '\n')

		if filtroVerde["Rojo"] == False: 	
			chat3.insert( indice,' Rojo:'+'\n' + pantalla2.get() + '\n')
		if filtroAzul["Rojo"] == False: 	
			chat. insert(indice, ' Rojo:'+'\n' + pantalla2.get() + '\n')
	n2.set("")		

	if proxy == 3:
		chat3.insert( indice,' Verde: '+'\n' + pantalla3.get() + '\n')

		if filtroRojo["Verde"] == False: 	
			chat2.insert(indice, ' Verde:'+'\n' + pantalla3.get() + '\n')
		if filtroAzul["Verde"] == False: 	
			chat. insert(indice, ' Verde:'+'\n' + pantalla3.get() + '\n')
	n3.set("")		

#-----------------------Avtivado de filtros----------------------------
def BloquearAzul_Rojo():
	if filtroAzul["Rojo"]  == False:
		filtroAzul["Rojo"]  = True
	else :
		filtroAzul["Rojo"]  = False	
	
def BloquearAzul_Verde():
	if filtroAzul["Verde"]  == False:
		filtroAzul["Verde"] = True
	else:
		filtroAzul["Verde"] = False
	
def BloquearRojo_Azul():
	if filtroRojo["Azul"]  ==  False:
		filtroRojo["Azul"] = True
	else:
		filtroRojo["Azul"] = False

def BloquearRojo_Verde():
	if filtroRojo["Verde"]  == False:
		filtroRojo["Verde"] = True
	else:
		filtroRojo["Verde"] = False

def BloquearVerde_Rojo():
	if filtroVerde["Rojo"]  == False:
		filtroVerde["Rojo"] = True
	else:
		filtroVerde["Rojo"] = False

def BloquearVerde_Azul():
	if filtroVerde["Azul"]  == False:
		filtroVerde["Azul"]	= True		
	else:
		filtroVerde["Azul"] = False

def salir(cadena):
	cadena.destroy()		


#----------------------------------------------Creacion de Ventanas---------

persona1=Tk()		
persona2=Tk()
persona3=Tk()
persona1.resizable(width=False, height=False)
persona2.resizable(width=False, height=False)
persona3.resizable(width=False, height=False)		 
#------------------------------------------------Barra de Menu 1------------                
barraMenu=Menu(persona1)
persona1.config(menu=barraMenu,width=300 , height=300)
menu1=Menu(barraMenu,tearoff=0)
menu1.add_checkbutton(label="Bloquear mensajes de Rojo", command=BloquearAzul_Rojo)
menu1.add_checkbutton(label="Bloquear mensajes de Verde",command=BloquearAzul_Verde)
menu1.add_separator()
menu1.add_command(label="Salir",command=persona1.destroy)
barraMenu.add_cascade(label="Filtro", menu=menu1)

#------------------------------------------------Barra de Menu 2------------                
barraMenu2=Menu(persona2)
persona2.config(menu=barraMenu2,width=300 , height=300)
menu2=Menu(barraMenu2,tearoff=0)
menu2.add_checkbutton(label="Bloquear mensajes de Azul", command=BloquearRojo_Azul)
menu2.add_checkbutton(label="Bloquear mensajes de Verde",command=BloquearRojo_Verde)
menu2.add_separator()
menu2.add_command(label="Salir",command=persona2.destroy)
barraMenu2.add_cascade(label="Filtro", menu=menu2)

#------------------------------------------------Barra de Menu 3------------                
barraMenu3=Menu(persona3)
persona3.config(menu=barraMenu3,width=300 , height=300)
menu3=Menu(barraMenu3,tearoff=0)
menu3.add_checkbutton(label="Bloquear mensajes de Rojo", command=BloquearVerde_Rojo )
menu3.add_checkbutton(label="Bloquear mensajes de Azul",command=BloquearVerde_Azul )
menu3.add_separator()
menu3.add_command(label="Salir",command=persona3.destroy)
barraMenu3.add_cascade(label="Filtro", menu=menu3)


#-----------------------------------persona 1-------------------------------
persona1.title("Mensajes")
lienzo=Frame(persona1)
lienzo.config(bg="#70e5ff")
lienzo.pack()

Helvfont = font.Font(family="Helvetica", size=12)
Azul=Label(lienzo, text="Chat de amigos", bg="#70e5ff",font=Helvfont)
Azul.grid(row=0 , column=0, sticky="w" ,padx=5 ,pady=5)

chat=Text(lienzo, width=20 ,height=12)
chat.grid(row=1 , column=0)

n=StringVar(value="")
pantalla=Entry(lienzo, textvariable=n)
pantalla.grid(row=3,column=0,padx=2,pady=10, columnspan=1)
pantalla.config(background="white", fg="#000000" ,justify="left")

scroll=Scrollbar(lienzo, command=chat.yview)
scroll.grid(row=1,column=1,sticky="nsew")
chat.config(yscrollcommand=scroll.set)

boton=Button(lienzo,text="Enviar" ,   width=6, command=lambda:enviar(1))
boton.grid(row=5, column=0,pady=4)
#------------------------------------ persona 2------------------------------
persona2.title("Mensajes")
lienzo2=Frame(persona2)
lienzo2.config(bg="#a71235")
lienzo2.pack()

Helvfont = font.Font(family="Helvetica", size=1)

Rojo=Label(lienzo2, text="Chat de amigos", bg="#a71235",font=Helvfont)
Rojo.grid(row=0 , column=0, sticky="w" ,padx=2 ,pady=2)

chat2=Text(lienzo2, width=20 ,height=12)
chat2.grid(row=1 , column=0)

n2=StringVar(value="")
pantalla2=Entry(lienzo2, textvariable=n2)
pantalla2.grid(row=3,column=0,padx=10,pady=10, columnspan=4)
pantalla2.config(background="white", fg="#000000" ,justify="left")

scroll=Scrollbar(lienzo2, command=chat2.yview)
scroll.grid(row=1,column=1,sticky="nsew")
chat2.config(yscrollcommand=scroll.set)

boton2=Button(lienzo2,text="Enviar" ,  width=6, command=lambda:enviar(2))
boton2.grid(row=4, column=0,pady=4)

#cuadroComentario.pack()
#-------------------------------------persona 3 ------------------------------
persona3.title("Mensajes")
lienzo3=Frame(persona3)
lienzo3.config(bg="#a7f235")
lienzo3.pack()

Helvfont = font.Font(family="Helvetica", size=1)
Verde=Label(lienzo3, text="Chat de amigos", bg="#a7f235",font=Helvfont)
Verde.grid(row=0 , column=0, sticky="w" ,padx=2 ,pady=2)

chat3=Text(lienzo3, width=20 ,height=12)
chat3.grid(row=1 , column=0)

n3=StringVar(value="")
pantalla3=Entry(lienzo3, textvariable=n3)
pantalla3.grid(row=3,column=0,padx=10,pady=10, columnspan=4)
pantalla3.config(background="white", fg="#000000" ,justify="left")

scroll=Scrollbar(lienzo3, command=chat3.yview)
scroll.grid(row=1,column=1,sticky="nsew")
chat3.config(yscrollcommand=scroll.set)

boton3=Button(lienzo3,text="Enviar" ,  width=6, command=lambda:enviar(3))
boton3.grid(row=4, column=0,pady=4)


persona1.mainloop()
