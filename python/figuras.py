 
import matplotlib.pyplot as plt
points = []

def lines (x0,y0,x1,y1):
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
            points.append((x0,round(m*x0+p)))
            x0+=sx#esto se puede trabajar con la misma suma que tenemos implementada
    else:
        m=dx/dy
        p=x0-m*y0
        while y0!=y1:
            points.append((round(m*y0+p),y0))
            y0+=sy
    x = list(map(lambda x: x[0], points))
    y = list(map(lambda x: x[1], points))
    
    plt.rc('grid', linestyle="-", color='black')
    plt.scatter(x, y)
    plt.grid(True)
    
    plt.show()
    
def circles(xc,yc,r):
    d = 3 - (2 * r)
    x = 0
    y = r
    points.append((xc+x, yc+y))
    points.append((xc-x, yc+y))
    points.append((xc+x, yc-y))
    points.append((xc-x, yc-y))
    points.append((xc+y, yc+x))
    points.append((xc-y, yc+x))
    points.append((xc+y, yc-x))
    points.append((xc-y, yc-x))
    while x <= y:
        x+=1
        if d<0:
            d = d + (4*x) + 6#oop /MAC R1, R2, R3
        else:
            d = d + 4 * (x - y) + 10
            y-=1
        points.append((xc+x, yc+y))
        points.append((xc-x, yc+y))
        points.append((xc+x, yc-y))
        points.append((xc-x, yc-y))
        points.append((xc+y, yc+x))
        points.append((xc-y, yc+x))
        points.append((xc+y, yc-x))
        points.append((xc-y, yc-x))
    
    x = list(map(lambda x: x[0], points))
    y = list(map(lambda x: x[1], points))
    
    plt.rc('grid', linestyle="-", color='black')
    plt.scatter(x, y)
    plt.grid(True)
    
    plt.show()
    


def elipseop(xc, yc, rx, ry):
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
        
        points.append((xc+x, yc+y))
        points.append((xc-x, yc+y))
        points.append((xc+x, yc-y))
        points.append((xc-x, yc-y))
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
        
        points.append((xc+x, yc+y))
        points.append((xc-x, yc+y))
        points.append((xc+x, yc-y))
        points.append((xc-x, yc-y))
        x += 1 
        paradax += poty
        error += dx
        dx += poty
        
        if((2*error + dy) > 0):
            y -= 1
            paraday -= potx
            error += dy
            dy += potx
        
    x = list(map(lambda x: x[0], points))
    y = list(map(lambda x: x[1], points))
    
    plt.rc('grid', linestyle="-", color='black')
    plt.scatter(x, y)
    plt.grid(True)
    
    plt.show()


