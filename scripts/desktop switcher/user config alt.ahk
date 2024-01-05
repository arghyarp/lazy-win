;OPTIMIZATIONS
#NoEnv
#KeyHistory 0
ListLines Off

SetCapsLockState, alwaysoff
CapsLock & 1::switchDesktopByNumber(1)
CapsLock & 2::switchDesktopByNumber(2)
CapsLock & 3::switchDesktopByNumber(3)
CapsLock & 4::switchDesktopByNumber(4)
CapsLock & 5::switchDesktopByNumber(5)
CapsLock & 6::switchDesktopByNumber(6)
CapsLock & 7::switchDesktopByNumber(7)
CapsLock & 8::switchDesktopByNumber(8)
CapsLock & 9::switchDesktopByNumber(9)

CapsLock & c::createVirtualDesktop()
CapsLock & d::deleteVirtualDesktop()

CapsLock & n::switchDesktopToRight()
CapsLock & p::switchDesktopToLeft()

CapsLock & tab::switchDesktopToLastOpened()

CapsLock::Send, #{Tab}
