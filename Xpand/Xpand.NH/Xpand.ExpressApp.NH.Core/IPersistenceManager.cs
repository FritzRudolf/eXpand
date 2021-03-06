﻿using DevExpress.Data.Filtering;
using Serialize.Linq.Nodes;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;

namespace Xpand.ExpressApp.NH.Core
{
    [ServiceContract]
    public interface IPersistenceManager
    {
        [OperationContract]
        IList GetObjects(string typeName, IList<CriteriaOperator> members,  string criteria, IList<ISortPropertyInfo> sorting, int topReturnedObjectsCount);

        [OperationContract]
        IList UpdateObjects(IList updateList, IList deleteList);

        [OperationContract]
        object GetObjectByKey(Type type, object key);

        [OperationContract]
        IList<ITypeMetadata> GetMetadata();

        [OperationContract]
        int GetObjectsCount(string typeName, string criteria);

        [OperationContract]
        object ExecuteExpression(ExpressionNode expressionNode);
    }
}
