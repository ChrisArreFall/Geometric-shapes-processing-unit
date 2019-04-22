import matplotlib.pyplot as plt
import numpy as np
import math

# Create the RGB figure matrix
matrix = np.ones((640,480, 3), dtype=np.uint8) * 255
def draw_line(x0,y0,x1,y1):
    dx = x1-x0
    dy = y1-y0
    
    # Calc if the point if further in x-y or before
    if dx < 0:
        sx=-1
    else:
        sx=1
    if dy < 0:
        sy=-1
    else:
        sy=1
    
    if abs(dy) < abs(dx):
        m = dy / dx
        p = y0 - m*x0#CAM

        steps = abs(dx)

        # Parallel part of the code
        while steps >= 8:
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            steps -= 8
        
        # Secuential part of the code
        while steps > 0:
            matrix[x0,math.floor(m*x0+p), :] = 0
            x0 += sx
            steps -= 1


    else:
        m = dx / dy
        p = x0 - m*y0

        steps = abs(dy)

        # Parallel part of the code
        while steps >= 8:
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy

            steps -= 8

        # Secuential part of the code
        while steps > 0:
            matrix[math.floor(m*y0+p),y0, :] = 0
            y0 += sy
            steps -= 1
    
    plt.imshow(matrix)
    plt.grid(True)
    #plt.show()



def draw_triangle(x1, y1, x2, y2, x3, y3):

    draw_line(x1, y1, x2, y2)
    draw_line(x1, y1, x3, y3)

    draw_line(x3, y3, x2, y2)

    plt.imshow(matrix)
    #plt.grid(True)

    
def draw_circle(xc,yc,r):
    d = 3 - (2 * r)
    x = 0
    y = r
    matrix[xc+x, yc+y, :] = 0
    matrix[xc-x, yc+y, :] = 0
    matrix[xc+x, yc-y, :] = 0
    matrix[xc-x, yc-y, :] = 0
    matrix[xc+y, yc+x, :] = 0
    matrix[xc-y, yc+x, :] = 0
    matrix[xc+y, yc-x, :] = 0
    matrix[xc-y, yc-x, :] = 0
    while x <= y:
        x+=1
        if d<0:
            d = d + (4*x) + 6#oop /MAC R1, R2, R3
        else:
            d = d + 4 * (x - y) + 10
            y-=1
        matrix[xc+x, yc+y, :] = 0
        matrix[xc-x, yc+y, :] = 0
        matrix[xc+x, yc-y, :] = 0
        matrix[xc-x, yc-y, :] = 0
        matrix[xc+y, yc+x, :] = 0
        matrix[xc-y, yc+x, :] = 0
        matrix[xc+y, yc-x, :] = 0
        matrix[xc-y, yc-x, :] = 0
    
    plt.imshow(matrix)
    plt.grid(True)
    #plt.show()
    


def draw_elipse(xc, yc, rx, ry):
    potx = 2*rx*rx
    poty = 2*ry*ry
    
    y = 0
    error = 0
    paraday = 0

    x = rx
    dx = ry*ry*(1 - 2*rx)
    dy = rx*rx
    
    paradax = poty*rx
    
    while paradax >= paraday:
        
        matrix[xc+x, yc+y, :] = 0
        matrix[xc-x, yc+y, :] = 0
        matrix[xc+x, yc-y, :] = 0
        matrix[xc-x, yc-y, :] = 0
        y += 1 
        paraday += potx
        error += dy
        dy += potx
        
        if((2*error + dx) > 0):
            x -= 1
            paradax -= poty
            error += dx
            dx += poty
            
            

    x = 0
    error = 0
    paradax = 0
    
    y = ry
    dx = ry*ry
    dy = rx*rx*(1 - 2*ry)
    paraday = potx*ry
    
    while paradax <= paraday:
        
        matrix[xc+x, yc+y, :] = 0
        matrix[xc-x, yc+y, :] = 0
        matrix[xc+x, yc-y, :] = 0
        matrix[xc-x, yc-y, :] = 0
        x += 1 
        paradax += poty
        error += dx
        dx += poty
        
        if((2*error + dy) > 0):
            y -= 1
            paraday -= potx
            error += dy
            dy += potx
        
    plt.imshow(matrix)
    plt.grid(True)
    #plt.show()



def fill_circle(xc, yc, r):

    if r > 1:

        for i in range(0, r): 
            draw_circle(xc, yc, i)

    matrix[xc, yc, :] = 0

def fill_elipse(xc, yc, rx, ry):

    # We search the smallest radius
    if(rx > ry):
        r_menor = ry
    else:
        r_menor = rx

    # Check if its big enought to be filled
    if r_menor > 1:

        for i in range(0, r_menor): 

            draw_elipse(xc, yc, rx, ry)

            rx -= 1
            ry -= 1 
        

        
        if(rx > ry):
            draw_line(xc + rx, yc, xc - rx, yc)

        else:
            draw_line(xc, yc + ry, xc, yc - ry)

        




def fill_triangle(x1, y1, x2, y2, x3, y3):

    if(x2 > x1):
        temp = x2
        x2 = x1
        x1 = temp

        temp = y2
        y2 = y1
        y1 = y2
    
    if(x3 > x1):
        temp = x3
        x3 = x1
        x1 = temp

        temp = y3
        y3 = y1
        y1 = y3
    
    if(y3 > y2):
        temp = x2
        x2 = x3
        x3 = temp

        temp = y3
        y3 = y2
        y2 = y3

    
    for i in range(y2 - y3):
        draw_line(x1,y1, x2, y2)
    



