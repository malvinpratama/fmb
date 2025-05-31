App on folder app/fmb

1.	Slicing UI
    a.	Register Device (Installation Wizard) ✅
    b.	Waiting Activation ✅
    c.	Login ✅
    d.	Success and Failed Login Pop-up ✅
    e.	On Duty Page with dummy data and static image❌
    f.	New Message Pop-up❌
    g.	Chat Page❌

2.	API and Websocket Integration
    a.	Installation Wizard
        i.	Generate a device ID using a random string. Check the device status via API using the device ID in ‘get device by id’ endpoint ✅
        ii.	Connect  and subscribe to the WebSocket channel /equipments/devices/$deviceId/activated using Centfigue v.0.8.0 ✅
        iii.	Based on response in step i, there are some condition:
            1.	If the device has not been registered (the response is Device Not Found!), then register it using the ‘register device’ endpoint ✅
            2.	If it is registered but not yet activated (value of is_active is false),  it should be redirected to the Waiting Activation Page ✅
            4.	If the device status is active (based on is_active value), or if WebSocket has sent data with the value of data['is_active'] is true, it will automatically be directed to LoginPage. ✅
    b.	Login Page
        vi.	Integrate the Login Page with the API (login tablet endpoint) and handle the following response conditions:
            1.	Success login ✅
            2.	Failed login ✅
    c.	New chat pop-up ❌
        i.	Subscribe to websocket channel /monitoring/messages/equipments/$unitId ❌
        iii.	If a new message arrives, show a new chat pop-up. If the user slides to "balas" or "mengerti," close the pop-up ❌
    d.	Chat page
        i.	Integrate with API to fetch all messages using ‘get all messages’ endpoint ❌

3.	Implement Clean Architecture (Data layer, Domain Layer, Presentation Layer)
4.	Implement Unit testing or Integration testing ✅
5.	Using state management like Bloc (Preferable), GetX, or others and Implement Dependency Injection
6.	Create technical documentation 