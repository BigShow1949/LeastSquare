//
//  ViewController.m
//  test2
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "ViewController.h"

double sum(double * dNumarry,int n);
double MutilSum(double* dX,double *dY,int n);
double RelatePow(double *dx,int n,int ex);
double RelateMutiXY(double *dx,double*dy,int n,int ex);
void EMatrix(double *dx,double*dy,int n,int ex,double coefficient[]);
void CalEquation(int exp,double coefficient[] );
double F(double c[],int l,int m);
double Em[10][10];
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double arry1[9]={1,3,4,5,6,7,8,9,10};
    double arry2[9]={10,5,4,2,1,1,2,3,4};
    double coefficient[10];
//    ZeroMemory(coefficient,sizeof(double)*10);
    
    //  double dSumarry1= sum(arry1,7);
    //  printf("darry1=%lf/n",dSumarry1);
    //
    //  double dSumarry2=sum(arry2,7);
    //  printf("darry2=%lf/n",dSumarry2);
    //
    //  double dMultiarry1=MutilSum(arry1,arry1,7);
    //  printf("dMultiarry1=%lf/n",dMultiarry1);
    
    //  double dMultiarry12=MutilSum(arry1,arry2,7);
    //  printf("dMultiarry2=%lf/n",dMultiarry12);//,coefficient[4],coefficient[5]
    //+ %lfx^3 + %lfx^4
    EMatrix(arry1,arry2,9,3,coefficient);
    
    printf("拟合方程为：y = %lf + %lfx + %lfx^2 /n",coefficient[1],coefficient[2],coefficient[3]);
    
}

double sum(double * dNumarry,int n)
{
    double *dTemp= new double[n];
    
    double dSum=0;
    
    dTemp=dNumarry;
    for (int i=0;i<n;i++)
    {
        dSum+=dTemp[i];
    }
    
    return dSum;
}

double MutilSum(double* dX,double *dY,int n)
{
    double * dXTemp= new double [n];
    double * dYTemp= new double [n];
    double dMultiSum=0;
    
    dXTemp=dX;
    dYTemp=dY;
    
    for (int i=0;i<n;i++)
    {
        dMultiSum += dX[i]*dY[i];
    }
    
    return dMultiSum;
    
}

double RelatePow(double *dx,int n,int ex)
{
    double * dTemp =new double[n];
    double ReSum=0;
    dTemp=dx;
    for (int j=0;j<n;j++)
    {
        ReSum+=pow(dTemp[j],ex);
    }
    return ReSum;
}

double RelateMutiXY(double *dx,double*dy,int n,int ex)
{
    double * dXTemp= new double [n];
    double * dYTemp= new double [n];
    double dReMultiSum=0;
    
    dXTemp=dx;
    dYTemp=dy;
    
    for (int i=0;i<n;i++)
    {
        dReMultiSum+=pow(dXTemp[i],ex)*dYTemp[i];
    }
    return dReMultiSum;
}



//计算方程组的增广矩阵
void EMatrix(double *dx,double*dy,int n,int ex,double coefficient[] )
{
    double * dXTemp= new double [n];
    double * dYTemp= new double [n];
    dXTemp=dx;
    dYTemp=dy;

    for(int i=1;i<=ex;i++)
    {

        for(int j=1;j<=ex;j++)
        {
            Em[i][j]=RelatePow(dXTemp,n,i+j-2);
        }
        Em[i][ex+1]=RelateMutiXY(dXTemp,dYTemp,n,i-1);
    }
    Em[1][1]=n;
    CalEquation(ex,coefficient);

}


//求解方程
void CalEquation(int exp,double coefficient[] )
{
    
    for(int k=1;k<exp;k++) //消元过程
    {
        for(int i=k+1;i<exp+1;i++)
        {
            double p1=0;
            
            if(Em[k][k]!=0)
                p1=Em[i][k]/Em[k][k];
            
            for(int j=k;j<exp+2;j++)
                Em[i][j]=Em[i][j]-Em[k][j]*p1;
        }
    }
    
    coefficient[exp]=Em[exp][exp+1]/Em[exp][exp];
    for(int l=exp-1;l>=1;l--)   //回代求解
        coefficient[l]=(Em[l][exp+1]-F(coefficient,l+1,exp))/Em[l][l];
    
}

double F(double c[],int l,int m)//供CalEquation函数调用
{
    double sum=0;
    for(int i=l;i<=m;i++)
        sum+=Em[l-1][i]*c[i];
    return sum;
}


- (void)test{
    //double sum(double * dNumarry,int n)
    //{
    //    double *dTemp= new double[n];
    //
    //    double dSum=0;
    //
    //    dTemp=dNumarry;
    //    for (int i=0;i<n;i++)
    //    {
    //        dSum+=dTemp[i];
    //    }
    //
    //    return dSum;
    //}
    
    //- (double)sumWithArr:(NSArray *)arr count:(int)count {
    //
    //    if (arr.count < count) {
    //        NSLog(@"count 错误");
    //    }
    //    double sum = 0;
    //    for (int i=0;i<count;i++)
    //    {
    //        NSNumber *num = arr[i];
    //        sum+= num.doubleValue;
    //    }
    //    return sum;
    //}
    //
    //- (double)mutilSumArr1:(NSArray *)arr1 arr2:(NSArray *)arr2 count:(int)count {
    //
    //    if (arr1.count < count || arr2.count < count) {
    //        NSLog(@"count 错误");
    //    }
    //    double sum = 0;
    //    for (int i=0;i<count;i++)
    //    {
    //        NSNumber *num1 = arr1[i];
    //        NSNumber *num2 = arr2[i];
    //        sum+= num1.doubleValue * num2.doubleValue;
    //    }
    //    return sum;
    //}
    //
    //- (double)RelatePowWithArr:(NSArray *)arr count:(int)count power:(int)power {
    //    if (arr.count < count) {
    //        NSLog(@"count 错误");
    //    }
    //    double sum = 0;
    //    for (int i=0;i<count;i++)
    //    {
    //        NSNumber *num = arr[i];
    //        sum+= pow(num.doubleValue,power);
    //    }
    //    return sum;
    //}
    //
    //- (double)RelateMutiArr1:(NSArray *)arr1 arr2:(NSArray *)arr2 count:(int)count power:(int)power {
    //    if (arr1.count < count || arr2.count < count) {
    //        NSLog(@"count 错误");
    //    }
    //    
    //    double sum = 0;
    //    for (int i=0;i<count;i++)
    //    {
    //        NSNumber *num1 = arr1[i];
    //        NSNumber *num2 = arr2[i];
    //        sum+= pow(num1.doubleValue, power) * num2.doubleValue;
    //    }
    //    return sum;
    //}

}

@end
