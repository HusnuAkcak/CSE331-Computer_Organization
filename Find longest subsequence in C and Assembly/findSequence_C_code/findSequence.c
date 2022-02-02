#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void findLongestSubArray(int *arr);
void subsetOfArray(int* currSubset, int currSubInd, int* inputArr, int index, int* longestSeq, int *maxLen);
void copyArray(int* dest, int*source, int len); 
void printArray(int *arr, int size);
int isIncreasingOrder(int *arr, int size);


int main() {
    int arrays [6][11] ={
        { 4, 1, 3, 4, 5 },
        { 5, 5, 53, 42, 88, 100 },
        { 6, 32, 222, 11, 5, 2, 4, 6},
        { 5, 4, 6, 7, 9 , 10},
        { 9, 1, 4, 5, 6, 7, 8, 9, 14, 15},
        // { 7, 1, 4, 5, 3, 9, 14, 15}
        {6, 3, 10, 7, 9, 4, 11}
    };

    // findLongestSubArray(arrays[5]);
    

    for(int i=0; i<6; ++i){
        findLongestSubArray(arrays[i]);
    }
    

    return 0;
}


void
findLongestSubArray(int *arr){

    int *longestSeq = malloc(arr[0]*sizeof(int)+1);
    int maxLen = 0;
    int *currSubset = malloc(arr[0]*sizeof(int)+1);

    subsetOfArray(currSubset, 0, arr, 1, longestSeq, &maxLen);

    fprintf(stderr, "longest: ");
    printArray(longestSeq, maxLen);
    fprintf(stderr, "------------------------------------\n");
    
    free(currSubset);
    free(longestSeq);
}

void
subsetOfArray(int* currSubset, int currSubInd, int* inputArr, int index, int* longestSeq, int* maxLen){

    if(index >= inputArr[0]+1 ) {
        
        if(*maxLen < currSubInd){
            copyArray(longestSeq, currSubset, currSubInd);
            *maxLen = currSubInd;
        }
        printArray(currSubset, currSubInd);
        return;
    }

    if(currSubInd == 0 || currSubset[currSubInd-1] <= inputArr[index]){
        currSubset[currSubInd++] = inputArr[index];
        subsetOfArray(currSubset, currSubInd, inputArr, index+1, longestSeq, maxLen);
        currSubInd--;
    }
    subsetOfArray(currSubset, currSubInd, inputArr, index+1, longestSeq, maxLen);
}

void
copyArray(int* dest, int*source, int len){

    for(int i=0; i<len; ++i){
        dest[i] = source[i];
    }
}

void 
printArray(int *arr, int size){

    if(arr == NULL)
        return;

    fprintf(stderr, "size: %d || ", size);
    for(int i=0; i<size; ++i){
        fprintf(stderr, "%d ", arr[i]);
    }
    fprintf(stderr, "\n");
 }

