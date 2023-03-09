.386
.model flat, stdcall
option casemap:none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib

.data
sisiKubus DWORD ?
volumeKubus DWORD ?
luasPermukaanKubus DWORD ?

promptSisiKubus BYTE "Masukkan panjang sisi kubus (cm): ", 0
pesanVolumeKubus BYTE "Volume kubus adalah ", 0
pesanLuasPermukaanKubus BYTE "Luas permukaan kubus adalah ", 0

.code
main PROC
    ; Menampilkan prompt untuk meminta input sisi kubus
    invoke StdOut, ADDR promptSisiKubus
    ; Membaca input sisi kubus dari pengguna
    invoke StdIn, ADDR sisiKubus
    ; Menghitung volume kubus
    mov eax, sisiKubus
    imul eax, sisiKubus
    imul eax, sisiKubus
    mov volumeKubus, eax
    ; Menghitung luas permukaan kubus
    mov eax, sisiKubus
    imul eax, eax
    mov luasPermukaanKubus, eax
    ; Menampilkan hasil perhitungan
    invoke StdOut, ADDR pesanVolumeKubus
    invoke StdOut, volumeKubus
    invoke StdOut, ADDR pesanLuasPermukaanKubus
    invoke StdOut, luasPermukaanKubus
    ; Keluar dari program
    invoke ExitProcess, 0
main ENDP
END main
