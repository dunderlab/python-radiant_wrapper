from radiant.framework.server import RadiantAPI, RadiantServer
from browser import html


########################################################################
class BareMinimum(RadiantAPI):

    # ----------------------------------------------------------------------
    def __init__(self, *args, **kwargs):
        """"""
        super().__init__(*args, **kwargs)
        self.body <= html.H1('Radiant Framework')


if __name__ == '__main__':
    RadiantServer('BareMinimum',
                  host='localhost',
                  port=5000,
                  )


