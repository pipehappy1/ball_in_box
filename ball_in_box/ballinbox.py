

__all__ = ['ball_in_box']

def ball_in_box(m=5, n=[(0.5, 0.5), (0.5, -0.5), (0.5, 0.3)]):
    """
    m is the number circles.
    n is the list of coordinates of tiny blocks.
    
    This returns a list of tuple, composed of x,y of the circle and r of the circle.
    """
    
    return [(0.5, 0.5, 0.5)
            ,(0.5, 0.5, 0.5)
            ,(0.5, 0.5, 0.5)
            ,(0.5, 0.5, 0.5)
            ,(0.5, 0.5, 0.5)]
