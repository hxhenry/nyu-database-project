from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.response import Response
from .serializers import AccountSerializer
from accounts.models import Account, LoanAccount,

@api_view(['GET'])
def getRoutes(request):

    routes = [
        {'GET': '/api/accounts'},
        {'GET': '/api/accounts/id'},
        {'POST': '/api/accounts/id/type'},

        {'POST': '/api/users/token'},
        {'POST': '/api/users/token/refresh'},
    ]
    return Response(routes)


@api_view(['GET'])
def getAccounts(request):
    accounts = Account.objects.all()
    serializer = AccountSerializer(accounts, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getAccount(request, pk):
    account = Account.objects.get(id=pk)
    serializer = AccountSerializer(account, many=False)
    return Response(serializer.data)



