
set(MODULE_NAME "base")

set(C_SRCS 
    los_bitmap.c los_err.c los_hwi.c los_lockdep.c los_misc.c
    los_mp.c los_percpu.c los_sortlink.c los_stackinfo.c
    los_task.c los_tick.c los_exc.c los_printf.c)

if(LOSCFG_BASE_IPC_QUEUE)
    list(APPEND C_SRCS los_queue.c)
endif()
if(LOSCFG_BASE_IPC_EVENT)
    list(APPEND C_SRCS los_event.c)
endif()
if(LOSCFG_BASE_IPC_MUX)
    list(APPEND C_SRCS los_mux.c)
endif()
if(LOSCFG_BASE_IPC_SEM)
    list(APPEND C_SRCS los_sem.c)
endif()
if(LOSCFG_BASE_CORE_SWTMR)
    list(APPEND C_SRCS los_swtmr.c)
endif()

#ringbuf
if(LOSCFG_KERNEL_RINGBUF)
    list(APPEND C_SRCS los_ringbuf.c)
endif()

# debug
if(LOSCFG_DEBUG_QUEUE)
    list(APPEND C_SRCS debug/los_queue_debug.c)
endif()
if(LOSCFG_DEBUG_MUTEX)
    list(APPEND C_SRCS debug/los_mux_debug.c)
endif()
if(LOSCFG_DEBUG_MUTEX_DEADLOCK)
    list(APPEND C_SRCS debug/los_mux_deadlock.c)
endif()
if(LOSCFG_DEBUG_SEMAPHORE)
    list(APPEND C_SRCS debug/los_sem_debug.c)
endif()
if(LOSCFG_DEBUG_SCHED_STATISTICS)
    list(APPEND C_SRCS debug/los_sched_debug.c)
endif()

# Schedulers
if(LOSCFG_SCHED_SQ)
    aux_source_directory(sched/sched_sq C_SRCS)
endif()
if(LOSCFG_SCHED_MQ)
    aux_source_directory(sched/sched_mq C_SRCS)
endif()

# Memory Algorithms
if(LOSCFG_KERNEL_MEM_BESTFIT)
    aux_source_directory(mem/bestfit C_SRCS)
endif()
if(LOSCFG_KERNEL_MEM_BESTFIT_LITTLE)
    aux_source_directory(mem/bestfit_little C_SRCS)
endif()

# Memory Extention
if(LOSCFG_KERNEL_MEM_SLAB_EXTENTION)
    aux_source_directory(mem/slab C_SRCS)
endif()
if(LOSCFG_MEM_TASK_STAT)
    aux_source_directory(mem/common/memstat C_SRCS)
endif()

# Membox
if(LOSCFG_KERNEL_MEMBOX_STATIC)
    list(APPEND C_SRCS mem/membox/los_membox.c)
endif()
if(LOSCFG_KERNEL_MEMBOX_DYNAMIC)
    list(APPEND C_SRCS mem/membox/los_membox_dyn.c)
endif()

# Memory Debug
if(LOSCFG_MEM_RECORDINFO)
    aux_source_directory(mem/common/memrecord C_SRCS)
endif()
if(LOSCFG_MEM_MUL_POOL)
    aux_source_directory(mem/common/multipool C_SRCS)
endif()

# Shellcmd
if(LOSCFG_SHELL)
    aux_source_directory(shellcmd C_SRCS)
endif()

add_library(${MODULE_NAME} STATIC
    ${C_SRCS})

target_include_directories(${MODULE_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/kernel/extended/include"
    "${CMAKE_SOURCE_DIR}/kernel/extended/include/lowpower"
    "${CMAKE_SOURCE_DIR}/kernel/base/mem")
