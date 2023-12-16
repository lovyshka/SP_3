.text
    .global sum_to_num
    
#rcx - col
#rdx - res
#rdi - matrix
#rsi - vector
#r8d - row
#r9d - total cnt
#r10d - get value from rdi
#r11d - get value from rsi
#r12d - cnt of ROW
#r13d - cnt of COL
#r14d - copy of address rdx

    sum_to_num:
  
        mov %rdx, %r14
        mov $0, %r12d
        mov $0, %r13d
        mov $0, %r9d
        xor %ebx, %ebx

    step:
        #сравнили счетчик col с количеством колонок
        cmp %r12d, %ecx 
        je put_in_res #если дошли до конца строки
        


        mov (%rdi), %r10d #берем число из matrix
        mov (%rsi, %r12, 4), %r11d  # берем число из vector

        mov %r10d, %eax #помещаем число из матрицы в eax для умножения
        imul %r11d     #умножаем eax на r11d
        
        add %eax, %ebx #добавляем в копилку

        add $4, %rdi #следующий индекс в матрице
        inc %r12d
        jmp step  
    
    put_in_res:
        mov %ebx, %eax 
        mov %rax, (%r14, %r13, 4) #то кладем копилку в res
    
        xor %ebx, %ebx

        cmp %r13d, %r8d # сравниваем счетчик строк с row 
        je exit_programm #если на последней строке и на последнем символе - выход
        
        inc %r13d # иначе увеличиваем значение
        
        mov $0, %r12d
        jne step # идем обратно считать

    exit_programm:
        ret








