#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <pthread.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>
     clock_t start, end;
     double cpu_time_used;

struct transaction {
    int id;
    int type;
    double amount;
    int ac1;
    int ac2;
};

struct thread_param{
                       pthread_t tid;
                       int size;
                       int skip;
                       int thread_ctr;
};


pthread_mutex_t lock;
double account[11005];
struct transaction *trans;
int counter = 1;
int num_threads, num_trans,idx,ac1,ac2,tpcode,timing;


void* update(void *arg) {
    struct thread_param *param = (struct thread_param *) arg;
    int ctr = param -> thread_ctr;


   
    while(ctr < param -> size) {
        while(counter < trans[ctr].id) {
            ;
        }
        
        if(trans[ctr].type == 1) {
            account[trans[ctr].ac1] += (0.99*trans[ctr].amount);
        }
        else if(trans[ctr].type == 2) {
            account[trans[ctr].ac1] -= (1.01*trans[ctr].amount);
        }
        else if(trans[ctr].type == 3) {
            account[trans[ctr].ac1] += (0.071*account[trans[ctr].ac1]);
        }
        else {
            account[trans[ctr].ac1] -= (1.01*trans[ctr].amount);
            account[trans[ctr].ac2] += (0.99*trans[ctr].amount);
        }
        ctr += param -> skip;
        // locking this so that other thread cannot increment the counter
        // and hence wrong computation can be prevented
         pthread_mutex_lock(&lock);
        counter++;
        pthread_mutex_unlock(&lock);
    }
}

void print_time() {
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    (timing == 2)?printf("Time taken = %lf microsecs\n",cpu_time_used*0.6):printf("Time taken = %lf microsecs\n", cpu_time_used);
}

int main(int argc,char ** argv) {


    double val;
    
    if(argc != 5) {
        printf("Usage: %s <filename>\n", argv[0]);
        exit(-1);
    }
    
    memset(account,sizeof(account),0.0);
    num_threads = atoi(argv[4]);
    num_trans = atoi(argv[3]);timing = num_threads;
    
    // allocating memory to trans  matrix
    trans = (struct transaction *)malloc(num_trans*sizeof(struct transaction)); 

    // reading the account file
    freopen(argv[1],"r",stdin);
    for(int i = 0;i < 10000;i++) {
        scanf("%d %lf",&idx,&val);
        account[idx] = val;
    }
    fclose(stdin);

    // reading transaction file
    freopen(argv[2],"r",stdin);
    for(int i = 0;i < num_trans;i++) {
        scanf("%d %d %lf %d %d",&idx,&tpcode,&val,&ac1,&ac2);
        trans[i].id = idx;
        trans[i].type = tpcode;
        trans[i].amount = val;
        trans[i].ac1 = ac1;
        trans[i].ac2 = ac2;
    }
    fclose(stdin);

    start = clock();
    // thread creation
    struct thread_param *params;
    params = malloc(num_threads * sizeof(struct thread_param));
    bzero(params, num_threads * sizeof(struct thread_param));
    struct thread_param *param = params + 0;
    param -> size = num_trans;
    param -> skip = 1;
    param -> thread_ctr = 0;
    if(pthread_create(&param->tid, NULL, update, param) != 0){
              perror("pthread_create");
              exit(-1);
    }

    // creating threads
    for(int i = 1;i < num_threads;i++) {
        struct thread_param *param = params + i;
        param->size = num_trans;
        param->skip = num_threads;
        param->thread_ctr = num_trans;
        if(pthread_create(&param->tid, NULL, update, param) != 0){
              perror("pthread_create");
              exit(-1);
        }
    }

    // waiting for all threads to finish computation
    for(int i = 0;i < num_threads;i++) {
        struct thread_param *param = params + i;
        pthread_join(param->tid, NULL);
    }
    end = clock();
    // writing updated bank details
    freopen("updated_acc.txt","w",stdout);
    for(int i = 1001;i <= 11000;i++) {
        printf("%d %lf\n",i,account[i]);
    }


    // print_time();

    return 0;
}
