from radiant.framework.server import RadiantAPI, RadiantServer


########################################################################
class BareMinimum(RadiantAPI):

    # ----------------------------------------------------------------------
    def __init__(self, *args, **kwargs):
        """"""
        super().__init__(*args, **kwargs)
        self.welcome()


if __name__ == '__main__':
    RadiantServer('BareMinimum',
                  host='localhost',
                  port=5001,
                  )


