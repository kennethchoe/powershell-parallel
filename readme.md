# Implementing Parallel Execution in Powershell

Series of code snippets to help you understand how to do parallel execution in Powershell 5 and 7.

This is a result of my team's work at [Abrigo](https://www.abrigo.com/) to improve the performance of its upgrade process.

## Powershell 5 vs 7

|                            | Powershell 5                                                 | Powershell 7                                     |
|----------------------------|--------------------------------------------------------------|--------------------------------------------------|
| Based On                   | .NET Framework                                               | .NET Core 3.x                                    |
| Installation               | As part of Microsoft Management Framework or Windows Updates | [Separately installable package](https://github.com/PowerShell/PowerShell/releases/)                   |
| Installed At               | C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe    | C:\Program Files\Powershell\7\pwsh.exe           |
| Pros                       | Feature complete                                             | Cross-platform <br/> Runs side-by-side with other versions |
| Cons                       | Windows only <br/> (5.1 has “core” edition also)   | Not implements all of Powershell 5 capabilities <br/> Not behaves exactly the same way as Powershell 5 |
| Parallel Execution Support | [Powershell Jobs](https://devblogs.microsoft.com/scripting/parallel-processing-with-jobs-in-powershell/) <br/> [Invoke-Parallel module](https://github.com/RamblingCookieMonster/Invoke-Parallel)  | [ForEach-Object -Parallel](https://devblogs.microsoft.com/powershell/powershell-foreach-object-parallel-feature/) |


## Code Snippets Flow

1. How to launch powershell code
2. How to coordinate multiple executions
    * Instantiating new execution
    * Waiting for all executions to end
    * How to throttle number of maximum concurrency
3. How to pass parameters and receive result in multi-threading
4. Synchronization (e.g. Mutex)
5. How to show the progress of multiple executions on the console
6. How to show progress on the console while generating logfile at the same time
7. How to pass parameters and receive result in multi-processing
8. Gotchas - strange behaviors

## Thread vs. Process

* A process begins with a single thread, and can have multiple threads.
* Heap vs. Stack
    * A process has its own memory and heap.
    * All threads in the same process shares heap (global variables goes in there), but each thread owns its own stack (local variables initiated inside the thread goes in there.)
* Multi-threading vs. Multi-processing
    * Multi-threading is lighter since you just instantiate another execution pointer.
    * Multi-threading is trickier to achieve, especially if your existing code assumes it is the only consumer of the heap variable.
    * Both require careful control over external shared resource, e.g. file.

## Runspace vs. Job

* Job is Powershell’s multi-processing helper
* Runspace is Powershell’s multi-threading helper

* [Invoke-Parallel](https://github.com/RamblingCookieMonster/Invoke-Parallel) module uses Runspaces

## Disclaimer

* I don't claim I am a powershell expert. I don't believe I understand its abstration properly, since there are moments that its behavior doesn't make any sense to me. Still, it is just available on every Windows system, thus a great tool to solve my company's problem - we have many on-prem installations on Windows.
