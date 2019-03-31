import matplotlib.pyplot as plt
import numpy as np

# Create the RGB figure matrix
matrix = np.ones((640,480, 3), dtype=np.uint8) * 255
def draw_line(x0,y0,x1,y1):
    dx=x1-x0
    dy=y1-y0
    if dx < 0:
        sx=-1
    else:
        sx=1
    if dy < 0:
        sy=-1
    else:
        sy=1
    
    if abs(dy) < abs(dx):
        m=dy/dx
        p=y0-m*x0
        while x0 != x1:
            matrix[x0,round(m*x0+p), :] = 0
            x0+=sx#esto se puede trabajar con la misma suma que tenemos implementada
    else:
        m=dx/dy
        p=x0-m*y0
        while y0!=y1:
            matrix[round(m*y0+p),y0, :] = 0
            y0+=sy
    
    plt.imshow(matrix)
    plt.grid(True)
    plt.show()
    
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
    
    x = rx
    y = 0
    
    dx = ry*ry*(1 - 2*rx)
    dy = rx*rx
    
    error = 0
    
    paradax = poty*rx
    paraday = 0
    
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
    y = ry
    
    dx = ry*ry
    dy = rx*rx*(1 - 2*ry)
    
    error = 0
    
    paradax = 0
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

        for i in range(1, r - 1): 
            draw_circle(xc, yc, i)

def fill_elipse(xc, yc, rx, ry):

    # We search the smallest radius
    if(rx > ry):
        r_menor = ry
        r_mayor = rx
        factor_x = 1
        factor_y = 0
    else:
        r_menor = rx
        r_mayor = ry

    if r_menor > 1:

        r_mayor -= r_menor - 1

        for i in range(1, r_menor - 1): 

            draw_elipse(xc, yc, rx, ry)

            rx -= 1
            ry -= 1 
        
        #fill_circle(xc, yc, r_mayor)
        for j in range(0, r_mayor):
            draw_line(xc + rx, yc + ry, xc - rx, yc - ry)




#def fill_triangle(p1, p2, p3):




