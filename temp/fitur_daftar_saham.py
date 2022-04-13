from pymysql import *
from tkinter import *
from tkinter import ttk

koneksi = Connection(host="localhost", user="root", database="saham_indonesia")
kursor = koneksi.cursor()


## Query untuk mengambil seluruh data dari tabel daftar_sektor
kursor.execute("""SELECT * FROM daftar_sektor;""")
Daftar_Sektor = kursor.fetchall()

Kode_Sektor = []
Nama_Sektor = []

for i in range(len(Daftar_Sektor)):
    j = 0
    if j <= 1:
        Kode_Sektor.append(Daftar_Sektor[i][0])
        Nama_Sektor.append(Daftar_Sektor[i][1])
        # Kode_Sektor,Nama_Sektor.insert(Daftar_Sektor[i][1])


def Pilih_Saham():
    koneksi = Connection(host="localhost", user="root", database="saham_indonesia")
    kursor = koneksi.cursor()

    ## Query untuk mengambil seluruh data dari tabel daftar_sektor
    kursor.execute(f"""SELECT kodeSaham, namaEmiten FROM daftar_saham_indonesia WHERE sektor_usaha = '{C_Pilih_Sektor.get()}';""")
    Emiten = kursor.fetchall()

    second = Toplevel()
    second.title("Pilih Saham")

    global Ticker_Saham
    global Nama_Emiten

    # List kosong untuk menampung ticker dan nama emiten setelah di looping
    Ticker_Saham = []
    Nama_Emiten = []

    for i in range(len(Emiten)):
        Ticker_Saham.append(Emiten[i][0])
        Nama_Emiten.append(Emiten[i][1])

    while i <= len(Emiten):
        ceklist_saham = Checkbutton(
            master=second,
            variable=Ticker_Saham,
            text=(str(Ticker_Saham) + "\t" + str(Nama_Emiten) + "\n")
        )
        ceklist_saham.grid(column=0, row=i)
        i += 1

    koneksi.commit()
    koneksi.close()


## Tkinter widget
mainan = Tk()
mainan.geometry("400x400")
mainan.title("Uji Coba Fitur Kode Saham")

L_Pilih_Sektor = Label(master=mainan, text="Daftar Sektor")
L_Pilih_Sektor.grid(column=0, row=0, sticky=W, padx=5, pady=10)
L_Pilih_Saham = Label(master=mainan, text="Daftar Saham")
L_Pilih_Saham .grid(column=0, row=1, sticky=W, padx=5, pady=10)

# L_Ticker_Saham = Label(master=second, text=str(Ticker_Saham) + "\n", justify=LEFT)
# L_Ticker_Saham.grid(column=0, row=0)

# L_Nama_Emiten = Label(master=second, text=str(Nama_Emiten) + "\n", justify=LEFT)
# L_Nama_Emiten.grid(column=1, row=0)

C_Pilih_Sektor = ttk.Combobox(master=mainan, width=30, height=1, justify=LEFT, values=Nama_Sektor, textvariable=Kode_Sektor)
C_Pilih_Sektor.grid(column=1, row=0, sticky=W, padx=5, pady=10)
B_Pilih_Ticker = Button(master=mainan, text="Pilih Ticker Saham", command=Pilih_Saham)
B_Pilih_Ticker.grid(column=1, row=1, sticky=W, padx=5, pady=10)

# C_Pilih_Ticker = ttk.Checkbutton()
# C_Pilih_Ticker.grid()


mainan.mainloop() # tkinter top level widget loop
koneksi.commit()
koneksi.close()
